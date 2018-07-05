//********************************************//
// MSDS 6390 - Visualization of Information   // 
// Assignment 8 - Mid-Term Data Viz Project   //
// Names:  Alma Lopez and George Sturrock     //
//********************************************//

import org.gicentre.geomap.*;
 
//GeoMap geoMap;
GeoMap geoMap;
DataTable buildTable;

Table table1, table2;
int[] scoresHOU = new int[12];
int[] scoresOPP = new int[12];
 
void setup(){
  size(1000, 1000);
   
  //geoMap = new GeoMap(this);  // Create the geoMap object.
  geoMap = new GeoMap(10,10,350,225,this); 
  buildTable = new DataTable();
  geoMap.readFile("world");   // Read shapefile.
  table1 = loadTable("scores01.csv", "header");
  background(202, 226, 245);  // Ocean colour
   stroke(0,40);               // Boundary colour
   fill(206,173,146); 
   geoMap.draw();  
  buildTable.drawTable(700,560, table1);
}

void draw(){
     
}
 
void draw123(){
  background(202, 226, 245);  // Ocean colour
  stroke(0,40);               // Boundary colour
  fill(206,173,146);          // Land colour
  
  geoMap.draw();              // Draw the entire map.
  
   
  // Find the country at mouse position and draw in different colour.
  int id = geoMap.getID(mouseX, mouseY);
  if (id != -1)
  {
    fill(180, 120, 120);      // Highlighted land colour.
    geoMap.draw(id);
  }
}
