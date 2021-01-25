import java.util.*;

//import apsync.*;
//import processing.serial.*;
//import processing.sound.*;

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
  size(1280, 700);
  gc = new GameController();
  escena = 1;
  
  bgImg = loadImage("Assets/4.png");
  //myFont = loadFont("Assets/04B_30__.TTF");
  botoImg = loadImage("Assets/Botó.png");
  plataforma = loadImage("Assets/Plataforma.png");
}


void draw(){
   escena();
}


void escena(){  
  if (escena == 0) {
    pantallaInicial(plataforma, bgImg, botoImg, myFont, x1, x2);
  }else if (escena == 1) {
    pantallaJoc();
  }else if (escena == 2){
    pantallaFinal(bgImg, plataforma, botoImg, myFont, x1, x2, this.gc.getScore());
  }  
}

void keyPressed()
{
   if(key == 32){
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
