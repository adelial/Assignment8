//********************************************//
// MSDS 6390 - Visualization of Information   // 
// Assignment 8 - Mid-Term Data Viz Project   //
// Names:  Alma Lopez and George Sturrock     //
//********************************************//
//ControlP5
import controlP5.*;
import org.gicentre.geomap.*;
 
GeoMap geoMap; 

DataTable buildTable;
Menu optionMenu;
ControlP5 cp5;

CirclesGraph AgeGraph;
PImage header; 

//wcMap worldCMap;

Table table1, table2;
color[] btncolors = new color[4];
String labels[] = {"GRAPHIC 1", "GRAPHIC 2", "GRAPHIC 3", "GRAPHIC 4"}; 

void setup(){
  size(1000, 1000);
  background(0);
  header = loadImage("longfifa.jpg");  //header graphic
  
  image(header,width/2-header.width/2,0);
  geoMap = new GeoMap(this);  // Create the geoMap object.
  btncolors[0] = color(#19C1BD);  // brackground
  btncolors[1] = color(0);  // label
  btncolors[2] = color(#D5F5F4);  // mouseover
  btncolors[3] = color(#109D0E);  // selected
  
  buildTable = new DataTable();
  optionMenu = new Menu(labels, 30, 100, btncolors);
  optionMenu.build(10, 470, true);
  
  AgeGraph = new CirclesGraph();
  
   // buildTable.drawTable(700,560, table1);
}

void draw(){
  wcMap(20, 60, "Country_rounds.csv", 800, 370); 
  
}

void mousePressed(){
  optionMenu.selectedButton();
}

 

  
