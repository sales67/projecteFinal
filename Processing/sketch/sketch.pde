import java.util.*;

import apsync.*;
import processing.serial.*;
import processing.sound.*;

int escena;


void setup(){
  size(1280, 700);
  escena = 0;
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
