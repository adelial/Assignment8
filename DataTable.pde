// class DrawTable use to build a data table
// position in the screen can be defined 
// number of columns are defined by the table used to populate the data table

class DataTable{
  int i =0;
  int distanceCell = 65;
 
  // size of a cell
  int sizeCellX = 66;
  int sizeCellY = 27;
 
  int xScreen=0;
  int yScreen=0;
  int text_size = 12; 
  
  Table dataCells;
  
       
  //Class Constructors
  // default
  DataTable(){    
  }
  
  // with position definition
  DataTable(int xScreen, int yScreen){
    this.xScreen = xScreen;
    this.yScreen = yScreen;
  }
  
  DataTable(int xScreen, int yScreen, int sizeCellX, int sizeCellY){
    this.xScreen = xScreen;
    this.yScreen = yScreen;
    this.sizeCellX = sizeCellX;
    this.sizeCellY = sizeCellY;
  }
  
  DataTable(int xScreen, int yScreen, int sizeCellX, int sizeCellY, Table dataCells){
    this.xScreen = xScreen;
    this.yScreen = yScreen;
    this.sizeCellX = sizeCellX;
    this.sizeCellY = sizeCellY;
    this.dataCells = dataCells;
  }
  
  //Class Functions
  // Number of columns are defined by the table passed as parameter 
  void drawTable(int posx, int posy, Table dataCells){
    
    int distanceCell = this.sizeCellX-1;
    int i=0, numCols=1;
    this.xScreen = posx;
    this.yScreen = posy;
    this.dataCells = dataCells;
    
    // draw header
    numCols = dataCells.getColumnCount();
   
    for (int cell=0; cell<numCols; cell++) { 
        textSize(this.text_size);
        textAlign(LEFT);
        fill(255);
        stroke(#47315D);
        rect(this.xScreen, this.yScreen, this.sizeCellX, this.sizeCellY);
        fill(0);
        text(this.dataCells.getColumnTitle(cell), xScreen+8, yScreen+16);
        this.xScreen = this.xScreen + distanceCell;
    }
    // new line
    this.xScreen=posx;   // back to left side again
    this.yScreen += this.sizeCellY+1;  //  new line
    for (TableRow row : this.dataCells.rows()) {
      for (int x=0; x < numCols; x++) { // build rows with numCols + squence number cells
        fill(255);
        stroke(#47315D);
        rect(this.xScreen, this.yScreen, this.sizeCellX, this.sizeCellY);
        fill(0);
        
        text(dataCells.getString(i,x), this.xScreen+8, this.yScreen+16);
        
        // just move to the right 
        this.xScreen = this.xScreen + distanceCell;
      }
      // new line
      this.xScreen=posx;   // back to left side again
      this.yScreen += this.sizeCellY+1;  //  new line
      i++;
    } // for
    
  } 
    
} // class
