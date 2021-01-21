import java.util.*;

import apsync.*;
import processing.serial.*;
import processing.sound.*;

int escena;
GameController gc;


void setup(){
  size(1280, 700);
  gc = new GameController();
  escena = 1;
}


void draw(){
   escena();
}


void escena(){  
  if (escena == 0) {
    pantallaInicial();
  }else if (escena == 1) {
    pantallaJoc();
  }else if (escena == 2){
    pantallaFinal();
  }  
}

void keyPressed()
{
   if(key == 32)
   {
     this.gc.jump();
   }
}
