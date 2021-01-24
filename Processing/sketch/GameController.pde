class GameController{
  
  int speed = 4;
  int score;
  Character c;
  
  GameController(){
    this.c = new Character(this.speed);
    this.score = 0;    
  }
  
  void update(){
    this.c.update();
    this.score++;      
  }
  
  void jump(){
   this.c.jump(); 
  } 
  
  public int getScore(){
    return this.score;
  }
}
