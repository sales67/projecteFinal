import java.util.*;

import apsync.*;
import processing.serial.*;
import processing.sound.*;

AP_Sync arduino;

Sound s;
SoundFile doS, reS, miS, faS, solS, laS, siS, wrong;
SoundFile backgroundMusic;

PFont font;
PFont font2;

//Escena actual
// -1 = ultrasons / 0 = incial / 1 = instruccions / 2 = joc / 3 = puntuacions
int escena = -1;

int score = 0;
int blocs = 0;
int keyClicked = -1;

final byte countdown = 45;
int seconds = -1, startTime;

//Sensor proximitat
int distSensor = 10000;

//Colors dels quadrats, fa falta cambiar per els colors corresponents
String[] colorsCubes = {"0,0,0", "186,74,0", "241,11,11", "245,176,65", "243,239,16", "254,144,234", "255,255,255"};

//Tecles de esquerra a dreta: A S D F G LEFT RIGHT
//Tecles de esquerra a dreta: Negre..........Blanc
//Tecles del Makey Makey definitives
int[] keyPiano = {65, 83, 68, 70, 71, LEFT, RIGHT};

//Puntuacions
int[] scoreSort;
String[] lines;

//Cubs partida
ArrayList<Cube> cubes = new ArrayList<Cube>();
int timerCubes;
//Cubs instruccions
ArrayList<CubeI> iCubes = new ArrayList<CubeI>();

void setup() { 
  size(1280, 700);
  //arduino = new AP_Sync(this,"COM3", 9600);
  frameRate(30);

  //Fonts
  font = createFont("font.ttf", 32);
  textFont(font);
  font2 = createFont("font2.ttf", 32);
  textFont(font2);

  //Sons
  doS = new SoundFile(this, "sounds/Do.mp3");
  reS = new SoundFile(this, "sounds/Re.mp3");
  miS = new SoundFile(this, "sounds/Mi.mp3");
  faS = new SoundFile(this, "sounds/Fa.mp3");
  solS = new SoundFile(this, "sounds/Sol.mp3");
  laS = new SoundFile(this, "sounds/La.mp3");
  siS = new SoundFile(this, "sounds/Si.mp3");

  wrong = new SoundFile(this, "sounds/wrong.mp3");
  wrong.amp(0.20);

  backgroundMusic = new SoundFile(this, "sounds/music.wav");
  backgroundMusic.amp(0.35);
  backgroundMusic.loop();

  //Score
  lines = loadStrings("scores.txt");
  scoreSort = sortScores(lines);
} 

void draw() {
  if (escena == -1) {
    frameRate(10);
    escena();
    if (distSensor < 20) {
      escena = 0;
    }
  } else if (escena == 0) {
    frameRate(10);
    escena_inicial();
  } else if (escena == 1) {
    frameRate(30);
    escena_instruccions();
  } else if (escena == 2) {
    if (seconds == 0) {
      //Guardar puntuacio
      String[] newScores = Arrays.copyOf(lines, lines.length + 1);
      newScores[newScores.length - 1] = String.valueOf(score);
      saveStrings("scores.txt", newScores);
      //Llegir puntuacions
      lines = loadStrings("scores.txt");
      scoreSort = sortScores(lines);
      escena = 3;
    }
    frameRate(30);
    escena_joc();
  } else {
    frameRate(10);
    escena_puntuacions();
  }
}

void keyPressed() {
  if (escena == -1) {
    if (key == 'q') escena = 0;
  } else if (escena == 0) { //Escena incial
    //Anar a jugar
    if (keyCode == keyPiano[0]) {
      startTime = millis()/1000 + countdown;
      doS.play();
      escena = 2;
    }
    //Anar a les instruccions
    else if (keyCode == keyPiano[6]) {
      siS.play();
      escena = 1; 
    }
  } 
  //Escena instruccions
  else if (escena == 1) { 
    //Anar a jugar
    if (keyCode == keyPiano[0]) {
      startTime = millis()/1000 + countdown;
      doS.play();
      escena = 2;
    }
  }
  //Escena partida
  else if (escena == 2) {
    if (keyCode == keyPiano[0])  keyClicked = 1;
    else if (keyCode == keyPiano[1])  keyClicked = 2;
    else if (keyCode == keyPiano[2])  keyClicked = 3;
    else if (keyCode == keyPiano[3])  keyClicked = 4;
    else if (keyCode == keyPiano[4])  keyClicked = 5;
    else if (keyCode == keyPiano[5])  keyClicked = 6;
    else if (keyCode == keyPiano[6])  keyClicked = 7;
    else{
      keyClicked = -1;
    }
  }
  //Escena puntuacions
  else if (escena == 3) {
    //Anar a jugar
    if (keyCode == keyPiano[0]) {
      doS.play();
      score = 0;
      blocs = 0;
      seconds = -1;
      startTime = millis()/1000 + countdown;
      cubes = new ArrayList<Cube>();
      escena = 2;
    }
  }

  //Notes musicals
  if (keyCode == keyPiano[0]) doS.play();
  else if (keyCode == keyPiano[1]) reS.play();
  else if (keyCode == keyPiano[2]) miS.play();
  else if (keyCode == keyPiano[3]) faS.play();
  else if (keyCode == keyPiano[4]) solS.play();
  else if (keyCode == keyPiano[5]) laS.play();
  else if (keyCode == keyPiano[6]) siS.play();
}
