class Bubble {
  float x, y;
  int diameter;
  String name;
  color circleColor;
  boolean over = false;
  
  Bubble(){
  }

  Bubble(int diameter, String name) {
    this.diameter = diameter;
    this.name = name;    
  }
 
  Bubble(int diameter, String name, color circleColor) {
    this.diameter = diameter;
    this.name = name;
    this.circleColor = circleColor;
  }
  
  // Display the Bubble
  void display(int xpos, int ypos, color circleColor) {
    stroke(0);
    strokeWeight(2);
    noFill();
    x = xpos;
    y = ypos;
    
    fill(color(circleColor));
    noStroke();
    ellipse(x, y, diameter, diameter);
    if (diameter > 10) {
      fill(0);
      textAlign(CENTER, CENTER);
      text(diameter,x,y);
      text(name,x,y+55);
    }
  }
}


class CirclesGraph {
  Bubble[] bubbles;
  // A Table object
  Table dataTable;
  ArrayList <Bubble> bages;
  float posx,posy;
  color backColor = color(#B5E5B5);
  color circleColor = color(#9396F7);

  CirclesGraph(){
  }
  CirclesGraph(float posx, float posy, Table dataTable, color backColor, color circleColor){
    this.posx = posx;
    this.posy = posy;
    this.dataTable = dataTable;
    this.backColor = backColor;
    this.circleColor = circleColor;
  }

  void loadData(String filename) {
    // Load CSV file into a Table object, sorted already in DESC order
    this.dataTable = loadTable(filename, "header");
 
    // The size of the array of Bubble objects is determined by the total number of rows in the CSV
    bubbles = new Bubble[dataTable.getRowCount()]; 

    // You can access iterate over all the rows in a table
    for (int i = 0; i < dataTable.getRowCount(); i++) {
      TableRow row = dataTable.getRow(i);
      // d number of players with a specific Age
      int d = row.getInt("counts");
      String n = row.getString("Age");
      // Make a Bubble object out of the data read
      bubbles[i] = new Bubble(d, n);
    }
  }
  
  void displayAll(int xval, int yval, color backColor, color circleColor) {
    fill(color(backColor));
    rect (xval, yval-50, width-xval*2,150); 
    xval = xval+bubbles[0].diameter/2 +40;
    yval = yval+bubbles[0].diameter/2 +10;
    for (int i = 0; i < bubbles.length; i++) {
      bubbles[i].display(xval, yval, circleColor);
      if (i < bubbles.length-1) {
        xval = xval+int(bubbles[i].diameter/2)+int(bubbles[i+1].diameter/2);
      }
    }
    textAlign(CENTER, CENTER);
    fill(0);
    text(dataTable.getColumnTitle(0),20,yval+55); 
  } 
}
