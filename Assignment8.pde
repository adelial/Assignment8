//********************************************//
// MSDS 6390 - Visualization of Information   // 
// Assignment 8 - Mid-Term Data Viz Project   //
// Names:  Alma Lopez and George Sturrock     //
//********************************************//

import org.gicentre.geomap.*;
 
 GeoMap geoMap; 

DataTable buildTable;
Menu optionMenu;

CirclesGraph AgeGraph;

wcMap worldCMap;

Table table1, table2;
int[] scoresHOU = new int[12];
int[] scoresOPP = new int[12];
String[] labels = new String[4];
color[] btncolors = new color[4];
 
 
void setup(){
  size(1000, 1000);
   
  geoMap = new GeoMap(this);  // Create the geoMap object.
 // geoMap = new GeoMap(10,10,350,225,this);
  labels[0] = "ONE";
  labels[1] = "TWO";
  labels[2] = "THREE";
  labels[3] = "FOUR";
  btncolors[0] = color(#19C1BD);  // brackground
  btncolors[1] = color(0);  // label
  btncolors[2] = color(#D5F5F4);  // mouseover
  btncolors[3] = color(#109D0E);  // selected
  
  buildTable = new DataTable();
  worldCMap = new wcMap(geoMap);
     
  worldCMap.display();   
optionMenu = new Menu(50,300, labels, 30, 50, btncolors);
 // buildTable.drawTable(700,560, table1);
  optionMenu.create(50, 300, false);
  
  AgeGraph = new CirclesGraph();
  AgeGraph.loadData("SquadsGroupAge.csv");
  AgeGraph.displayAll(5,700, color(#CDFACC), color(#2B8BDE));
}

void draw(){
     
}
 
