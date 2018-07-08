import org.gicentre.geomap.*;

class wcMap {
  Table tableWC;
  int sizeh=300;
  int sizew= 500;
  //GeoMap geoMap;
  GeoMap geoMap;
  String file_name, mapTitle;
  
  wcMap(){
  }
  wcMap(GeoMap geoMap){
    this.geoMap = geoMap;
  }
  wcMap(int sizeh, int sizew, String file_name, String mapTitle){
    this.sizeh = sizeh;
    this.sizew = sizew;
    this.file_name = file_name;
    this.mapTitle = mapTitle;
  }
  
  void display(){
    geoMap = new GeoMap(geoMap); 
    geoMap = new GeoMap(10, 10, sizew, sizeh, this.geoMap);
    geoMap.readFile("world");
    tableWC = loadTable(file_name);

    background(255);
    stroke(255);
    strokeWeight(0.5);
   
    // Draw countries
    for (int id : geoMap.getFeatures().keySet())
    {
      String countryCode = geoMap.getAttributeTable().findRow(str(id),0).getString("ISO_A3");    
      TableRow dataRow = tableWC.findRow(countryCode, 0);
 
      if (dataRow != null)       // Table row matches country code
      {
        //float normBadTeeth = dataRow.getFloat(2)/dataMax;
        fill(#354332);
      }
      else                   // No data found in table.
      {
        fill(#D1D3D1);
      }
      geoMap.draw(id); // Draw country
    }
     // Draw title text
    fill(50);
    textAlign(LEFT, TOP);
    text(mapTitle, 10, sizeh-20);
  }
}
 
