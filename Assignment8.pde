//********************************************//
// MSDS 6390 - Visualization of Information   // 
// Assignment 8 - Mid-Term Data Viz Project   //
// Names:  Alma Lopez and George Sturrock     //
//********************************************//
//ControlP5
import controlP5.*;
import org.gicentre.geomap.*;
import grafica.*; //Goal Distribution
import org.gicentre.utils.stat.*; //Market Value

GeoMap geoMap; 
GPlot plot;
BarChart barChart;
MarketValue marketValue;
Cards card;

DataTable buildTable;
Menu optionMenu;
ControlP5 cp5;

CirclesGraph AgeGraph;
PImage header, bg; 

//wcMap worldCMap;

Table table1, table2;
color[] btncolors = new color[4];
String labels[] = {"AGES", "GOALS", "MARKET", "CARDS"}; 
//Market Value
float[] barData = new float[10];
String[] cName = new String[10];
int lineCount = 0;
int cardsDrawn = 0;

void setup(){
  size(1000, 1000);
  bg = loadImage("fifa2018bg (2).jpg");
  background(bg);
  header = loadImage("longfifa.jpg");  //header graphic

  
  image(header,width/2-header.width/2,0);
  geoMap = new GeoMap(this);  // Create the geoMap object.
  //btncolors[0] = color(#19C1BD);  // brackground
  btncolors[0] = color(#2B8BDE);  // brackground - Russian Flag Blue
  btncolors[1] = color(0);  // label
  btncolors[2] = color(#D5F5F4);  // mouseover
  btncolors[3] = color(#109D0E);  // selected
  
  buildTable = new DataTable();
  optionMenu = new Menu(labels, 30, 100, btncolors);
  //optionMenu.build(10, 470, true);

  card = new Cards(); 
  
  //Market Value
  marketValue = new MarketValue();
  barChart = new BarChart(this);
  //Retrieve Data for the Market Value Bar Chart
  marketValue.setMV();
  barData = marketValue.getMV();
  cName = marketValue.getCountry();
  
  AgeGraph = new CirclesGraph();
  goalTime();
   // buildTable.drawTable(700,560, table1);
}

void draw(){
  background(bg);
  image(header,width/2-header.width/2,0);
  wcMap(20, 60, "Country_rounds.csv", 960, 400); 
  
  optionMenu.build(300, 480, true);
  
  if (mousePressed && mouseButton == LEFT){
    optionMenu.selectedButton();
  }
  else {
    optionMenu.keepButton();
  }
  
  //AgeGraph = new CirclesGraph();
  //AgeGraph.displayAll(10, 600, color(#B5E5B5), color(#9396F7));
  
}

//void mousePressed(){
//  optionMenu.selectedButton();
//}

 

  
