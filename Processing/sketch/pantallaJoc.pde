import de.voidplus.leapmotion.*;


LeapMotion leap;
int movmentSpeed;
void pantallaJoc(){ 
  gc.update();  
  moviment();
  if (this.right){
    this.gc.right(movmentSpeed);
  }else if (this.left){
    this.gc.left(movmentSpeed);
  }
}


void moviment(){
  for (Hand hand : leap.getHands ()) {

    if(hand.isRight()){
      float petit = hand.getFinger("pinky").getPosition().y;
      float gran = hand.getFinger("thumb").getPosition().y;
      
      movmentSpeed = (int)map((gran - petit), 0, 100, 0, 10);
      
      println(movmentSpeed);
      if((gran - petit) <= 0){
        this.right = true;
        this.left = false; 
      }else{
        this.right = false;
        this.left = true; 
      }
    }
  }
}
