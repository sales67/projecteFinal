class Platform{
  int x,y;
  int size, speed;
  
  Platform(int speed){
    this.x = -10;
    this.y = (int)random(20,1100);
    this.size = 10;
    this.speed = speed-2;
  }
  
  void update() {
    fill(255, 255, 255);
    rect(this.y,this.x,this.size*4,this.size);
    this.x += this.speed;
  }
  
  int getX(){
    return this.x;
  }
  
  int getY(){
    return this.y;
  }
  
}
