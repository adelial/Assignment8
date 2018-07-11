class Cards{

  float availW = width-20;
  float availH = height/2 - 20;
  //int lineCount = 0;
  //int cardsDrawn = 0;
  color yellow = #FFF948;
  color red = #FC0810;  
  int ycard, rcard, cardw, cardh, cpl;
  int increment = 10;
  int startX = 0;
  int startY = 620;
  
  Cards(){
  }
  
  Cards(int ycard, int rcard, int cardw, int cardh, int cpl){  
    this.ycard = ycard;
    this.rcard = rcard;
    this.cardw = cardw;
    this.cardh = cardh;
    this.cpl = cpl; 
  }
  
  void cardDraw(int ycard, int rcard, int cardw, int cardh, int cpl){
    
    int totCard = ycard + rcard;

    for (int i=0; i < (round(totCard / cpl)) && cardsDrawn <= totCard; i++){
      if (lineCount > 0){
        startY += increment + cardh;
      }
      lineCount += 1;
      startX = 20;
      for (int j=0; j < cpl && cardsDrawn <= totCard; j++){

        if (cardsDrawn <= (ycard)){
          fill(yellow);
        } 
        else {
          fill(red);
        }
        rect(startX, startY, cardw, cardh);
        startX += cardw + 5; 
        cardsDrawn += 1;
      }
    
    }
    //textSize(58);
    fill(0);
    text("205", 100, 780);
  }
}
