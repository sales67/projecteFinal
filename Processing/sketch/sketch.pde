import java.util.*;

int escena;
GameController gc;
PImage bgImg;
float x1 = 0;
float x2;
PFont myFont;
PImage botoImg;
PImage plataforma;
boolean right,left;


void setup(){
  size(700, 1000);
  gc = new GameController();
  escena = 0;
  x2 = width;
  bgImg = loadImage("Assets/4.png");
  myFont = createFont("Assets/04B_30__.TTF", 34);
  botoImg = loadImage("Assets/Botó.png");
  plataforma = loadImage("Assets/Plataforma.png");
  leap = new LeapMotion(this);
}


void draw(){
  backGroundMove();
   escena();
}


void escena(){  
  if (escena == 0) {
    pantallaInicial();
  }else if (escena == 1) {
    pantallaJoc();
  }else if (escena == 2){
    pantallaFinal( this.gc.getScore());
  }  
  
  if(this.gc.getCharacter().getX() >= 1000){
    escena = 2;
  }
}

void keyPressed()
{
  if(escena == 0 && key == 32){
    escena = 1;
  }else if(escena == 1 && key == 32){
     this.gc.jump();
     
   }
   if (keyCode == RIGHT){
     this.right = true;     
     }
     if (keyCode == LEFT){
       this.left = true;     
     }
   

}

void keyReleased(){
  if (keyCode == RIGHT){
    this.right = false;
  }
  
  if (keyCode == LEFT){
     this.left = false;     
   }
  
}

void backGroundMove( ) {
 bgImg.resize(width, height);
  image(bgImg, 0, x1);
  image(bgImg, 0, x2);
  
  x1 -= 0.5;
  x2 -= 0.5;

  if (x1 < -width) {
    x1 = width;
  }
  if (x2 < -width) {
    x2 = width;
  }
}
