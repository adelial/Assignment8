// Menu for selection
class Menu {
  float posx, posy;
  String[] ctrlabels;
  color[] ctrcolors;
  float ctrh, ctrw;
  Button[] controls;
  int keeper;
  
  Menu(){
  }
  
  Menu(String[] ctrlabels, color[] ctrcolors){
   this.ctrlabels = ctrlabels;
   this.ctrcolors = ctrcolors;
   controls = new Button[ctrlabels.length];
  }
  
  Menu(String[] ctrlabels, float ctrh, float ctrw, color[] ctrcolors){
   this.ctrlabels = ctrlabels;
   //this.ctrcolors = ctrcolors;
   this.ctrh = ctrh;
   this.ctrw = ctrw;
   this.ctrcolors = ctrcolors;
   controls = new Button[ctrlabels.length];
  }
  
  void build(float posx, float posy, boolean horizontal){
    PVector ctrpos;
    this.posx = posx;
    this.posy = posy;
    
    for (int i=0; i<ctrlabels.length; i++) {
      ctrpos = new PVector(posx, posy);  
    
      controls[i] = new Button(this.ctrlabels[i],ctrpos, this.ctrh, this.ctrw, this.ctrcolors);
      controls[i].display();
      if (horizontal) {
        posx = posx+ctrw;
      }   
      else {
        posy = posy+ctrh;
      }
    }
   // selectedButton();
  }
  
  void selectedButton() {
    String optionSelected="";
    
    for (int i=0; i<controls.length; i++) {
      if (controls[i].isSelected() && mousePressed) {
        controls[i].backcol = btncolors[3];
        controls[i].selected = true;
        controls[i].display();
        optionSelected = controls[i].label;
      }
      else {
        controls[i].backcol = btncolors[0];
        controls[i].selected = false;
        controls[i].display();
      }
    }
    fill(255);
    switch(optionSelected) {
          case ("AGES"):
            AgeGraph.loadData("SquadsGroupAge.csv");
            //AgeGraph.displayAll(70,600, color(#CDFACC), color(#2B8BDE));
            AgeGraph.displayAll(70,600, color(#BB0104, 70), color(#2B8BDE));
            keeper = 1;
            break;
          case ("GOALS"):
            //rect(0, this.posy+ctrh, width-this.posx, height-this.posy-ctrh); 
            drawGoalTime();
            keeper = 2;
            break;
          case ("MARKET"):
            //rect(0, this.posy+ctrh, width-this.posx, height-this.posy-ctrh); 
            marketValue.mvDraw(cName, barData);
            keeper = 3;
            break;
          case ("CARDS"):
            //rect(0, this.posy+ctrh, width-this.posx, height-this.posy-ctrh);
            lineCount = 0;
            cardsDrawn = 0;
            card.cardDraw(205, 4, 20, 40, 38);
            keeper = 4;
          default:
            keeper = 1;
            fill(0);
    }    
  }
  void keepButton(){
    switch(keeper) {
          case (1):
            AgeGraph.loadData("SquadsGroupAge.csv");
            AgeGraph.displayAll(70,600, color(#BB0104, 70), color(#2B8BDE));
            keeper = 1;
            break;
          case (2):
            //rect(0, this.posy+ctrh, width-this.posx, height-this.posy-ctrh); 
            drawGoalTime();
            keeper = 2;
            break;
          case (3):
            //rect(0, this.posy+ctrh, width-this.posx, height-this.posy-ctrh); 
            marketValue.mvDraw(cName, barData);
            keeper = 3;
            break;
          case (4):
            //rect(0, this.posy+ctrh, width-this.posx, height-this.posy-ctrh);
            lineCount = 0;
            cardsDrawn = 0;
            card.cardDraw(205, 4, 20, 40, 38);
            keeper = 4;
          default:
            keeper = 1;
            fill(0);
    }        
  }
}
