class Button{
  PVector pos;
  color backcol, labelcolor, mousecolor, selcolor;
  color[] controlColors;
  float bh, bw;
  String label;
  Boolean selected=false;

  Button() {
  }
  
  Button(String label, PVector pos, float bh, float bw, color[] controlColors) {
    this.pos = pos;
    this.label = label;
    this.bh = bh;
    this.bw = bw;
    this.controlColors = controlColors;
    this.backcol = controlColors[0];
    this.labelcolor = controlColors[1];
    this.mousecolor = controlColors[2];
    this.selcolor = controlColors[3];
 }
   
  void display() {
    fill(color(this.backcol));
    
    noStroke();
    rect(pos.x, pos.y, bw, bh, 7); //round border
    
    fill(color(this.labelcolor));
    float wlabel= textWidth(label);
    textAlign(LEFT,CENTER);
    text(label, pos.x+(bw-wlabel)/2, pos.y+15);       
  }

  boolean isSelected() {
    if (mouseX > pos.x && mouseX < pos.x + bw && mouseY > pos.y && mouseY < pos.y + bh ) 
      return true;
    else return false;
  }

}
