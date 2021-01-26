class GameController{
  
  int speed = 4;
  float score;
  Character character;
  ArrayList<Platform> platforms;
  int i;
  Platform plat;
  GameController(){
    this.character = new Character(this.speed);
    this.score = 0;    
    platforms  = new ArrayList<Platform>();
  }
  
  void update(){
    int rand = (int)random(100);
    this.character.update(collision());
    this.score += 0.01;    
    
    this.crearPlataformes(rand);
    this.pintarPlataformes(); 
  }
  
  boolean collision(){
    for(Platform p : platforms){
      if (this.character.getSpeed() > 0 && 
          this.character.getX() >= p.getX() - 40 &&
          this.character.getX() < p.getX()  &&
          this.character.getY() >= p.getY() -20 &&
          this.character.getY() < p.getY() + 30){
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
   this.character.jump(); 
  }
  
  void left(){
    this.character.left();
  }
  
  void right(){
    this.character.right();
  }
  
  public float getScore(){
    return this.score;
  }
  
  public Character getCharacter() {
    return this.character;
  }
}
