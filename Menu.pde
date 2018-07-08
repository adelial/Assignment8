class Menu {
  float posx, posy;
  String[] ctrlabels;
  color[] ctrcolors;
  float ctrh, ctrw;
  Button[] controls;
  
  Menu(){
  }
  
  Menu(float posx, float posy,String[] ctrlabels, float ctrh, float ctrw, color[] ctrcolors){
   this.posx = posx;
   this.posy = posy;
   this.ctrlabels = ctrlabels;
   //this.ctrcolors = ctrcolors;
   this.ctrh = ctrh;
   this.ctrw = ctrw;
   this.ctrcolors = ctrcolors;
   controls = new Button[ctrlabels.length];
  }
  
  void create(float posx, float posy, boolean horizontal){
    PVector ctrpos;
    color[] ctrcol = new color[4];
    ctrcol = this.ctrcolors;
    
    for (int i=0; i<ctrlabels.length; i++) {
      ctrpos = new PVector(posx, posy);  
      println(this.ctrw);
      controls[i] = new Button(ctrlabels[i],ctrpos, this.ctrh, this.ctrw, ctrcol);
      controls[i].display();
      if (horizontal) {
        posx = posx+ctrw;
      }   
      else {
        posy = posy+ctrh;
      }
    }
  }
}
