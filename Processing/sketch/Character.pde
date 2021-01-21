class Character{
  
  float x,y;
  int size, speedConstant, speed,  jumpForce, maxSpeed;
  boolean jumping, up;
  
  Character(int speed){
    this.x = 400;
    this.y = 600;
    this.size = 25;
    this.jumpForce = 2;
    this.speedConstant = speed;
    this.speed = speed;
    this.up = true;
    this.maxSpeed = -20;
  }
  
  void update() {
    fill(255, 255, 255);
    rect(this.y,this.x,this.size,this.size);
    this.x += this.speed;
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
}
