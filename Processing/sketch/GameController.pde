class GameController{
  
  int speed = 4;
  int score;
  Character c;
  ArrayList<Platform> platforms;
  
  GameController(){
    this.c = new Character(this.speed);
    this.score = 0;    
    platforms  = new ArrayList<Platform>();
  }
  
  void update(){
    int rand = (int)random(100);
    this.c.update(collision());
    this.score++;    
    
    this.crearPlataformes(rand);
    this.pintarPlataformes();       
  }
  
  boolean collision(){
    for(Platform p : platforms){
      if (this.c.getSpeed() > 0 && 
          this.c.getX() >= p.getX() - 15 &&
          this.c.getX() < p.getX()  &&
          this.c.getY() >= p.getY() -20 &&
          this.c.getY() < p.getY() + 30){
          return true;
      }
    }
    return false;
  }
 
  
  void crearPlataformes(int rand){
    if (rand == 1){
      this.platforms.add(new Platform(this.speed));
    } 
  }
  
  void pintarPlataformes(){
    for(Platform p : platforms){
        p.update();
    }
  }
  
  void jump(){
   this.c.jump(); 
  }
  
  void left(){
    this.c.left();
  }
  
  void right(){
    this.c.right();
  }
  
  public int getScore(){
    return this.score;
  }
}
