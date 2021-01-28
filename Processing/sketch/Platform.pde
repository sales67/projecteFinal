class Platform{
  int x,y;
  int size, speed;
  PImage platImage;
  
  Platform(int speed){
    this.x =  -10;
    this.y = (int)random(20,680);
    this.size = 20;
    this.speed = speed-2;
    this.platImage = loadImage("Assets/Plataforma.png");
  }
  
  Platform(int speed, int x, int y){
    this.x =  x;
    this.y = y;
    this.size = 20;
    this.speed = speed-2;
    this.platImage = loadImage("Assets/Plataforma.png");
  }
  
  void update() {
    image(this.platImage, this.y,this.x, this.size *4, this.size);
    this.x += this.speed;
  }
  
  int getX(){
    return this.x;
  }
  
  int getY(){
    return this.y;
  }
  
  int getSize(){
   return this.size; 
  }
}
