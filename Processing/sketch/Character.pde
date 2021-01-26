class Character{
  
  int x,y;
  int size, speedConstant, speed,  jumpForce, maxSpeed;
  boolean jumping, up;
  PImage characterImage;
  
  Character(int speed){
    this.x = 400;
    this.y = 600;
    this.size = 25;
    this.jumpForce = 2;
    this.speedConstant = speed;
    this.speed = speed;
    this.up = true;
    this.maxSpeed = -20;
    this.characterImage  = loadImage("Assets/Pingu.png");
  }
  
  void update(boolean collision) {
    image(this.characterImage, this.y,this.x, this.size*2, this.size*2);
    if (collision){
      this.x += this.speedConstant-2;
    }else{
      this.x += this.speed;
    }
    if (jumping){
      jumping();
    }
  }
  
  void jump(){
    this.jumping = true;
  } 
  
  void jumping(){
    if (this.up){
      this.speed -= this.jumpForce;
    }else{
      this.speed += this.jumpForce;
      if (this.speed >= this.speedConstant){
        this.up = true;
        this.jumping = false;
      }
    }  
    if (this.speed <= this.maxSpeed){  
      this.up = false;
    }    
  }
  
  void left(int movmentSpeed){
    this.y -= movmentSpeed;
    if(this.y < 0){
      this.y = 700;
    }
  }
  void right(int movmentSpeed){
    this.y -= movmentSpeed;
    if(this.y > 700){
      this.y = 0;
    }
  }
  
  int getSpeed(){
    return this.speed;
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
