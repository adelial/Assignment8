// Menu for selection
class Menu {
  float posx, posy;
  String[] ctrlabels;
  color[] ctrcolors;
  float ctrh, ctrw;
  Button[] controls;
  
  
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
    fill(0);
    switch(optionSelected) {
          case ("GRAPHIC 1"):
            AgeGraph.loadData("SquadsGroupAge.csv");
            AgeGraph.displayAll(70,600, color(#CDFACC), color(#2B8BDE));
            break;
          case ("GRAPHIC 2"):
            rect(0, this.posy+ctrh, width-this.posx, height-this.posy-ctrh); 
            break;
          case ("GRAPHIC 3"):
            rect(0, this.posy+ctrh, width-this.posx, height-this.posy-ctrh); 
            break;
            
          default:
            fill(0);
    }
  }  
}
