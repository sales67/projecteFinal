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
    plataformesInicials();
  }
  
  void plataformesInicials(){
    this.platforms.add(new Platform(this.speed,100,100));
    this.platforms.add(new Platform(this.speed,150,250));
    this.platforms.add(new Platform(this.speed,220,120));
    this.platforms.add(new Platform(this.speed,400,450));
    this.platforms.add(new Platform(this.speed,370,380));
    this.platforms.add(new Platform(this.speed,520,40));
    this.platforms.add(new Platform(this.speed,445,220));
    this.platforms.add(new Platform(this.speed,510,600));    
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
          this.character.getY() < p.getY() + 60){
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
    if (collision()){
     this.character.jump();
    }
  }
  
  void left(int movmentSpeed){
    this.character.left(movmentSpeed);
  }
  
  void right(int movmentSpeed){
    this.character.right(movmentSpeed);
  }
  
  public float getScore(){
    return this.score;
  }
  
  public Character getCharacter() {
    return this.character;
  }
}
