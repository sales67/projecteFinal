void pantallaFinal(PImage bgImg, PImage plataforma, PImage botoImg, PFont myFont, float x1, float x2, int score){
  backMove(bgImg, x1, x2);
  plataforma(plataforma);
  opacitat();
  pintarScore(myFont, score);
  btnFin(botoImg);
}

void opacitat(){
  fill(128, 128, 128, 60);
  noStroke();
  beginShape();
  vertex(0, 0);
  vertex(720, 0);
  vertex(720, 1000);
  vertex(0, 1000);
  endShape();
}

void plataforma(PImage plataforma){
  //Barra gran
  image(plataforma, 0,842, width, 159);
}

void btnFin(PImage botoImg){
  image(botoImg, 260, 568, 194, 205);
}

void pintarScore(PFont myFont, int score) {
  textFont(myFont);
  textSize(75);
  fill(204, 163, 0);
  text("YOU FALL", 122, 240);
  text("SCORE:" + score, 63, 370);
  textSize(65);
  text("PLAY AGAIN", 98, 505);
  fill(204, 204, 204);
  textSize(75);
  fill(204, 204, 204);
  text("YOU FALL", 127, 232);
  text("SCORE:" + score, 75, 360);
  textSize(65);
  text("PLAY AGAIN", 106, 495);
}

void backMove(PImage bgImg, float x1, float x2) {
  bgImg.resize(width, height);
  image(bgImg, 0, x1); //<>//
  image(bgImg, 0, x2); //<>//
  
  println(x1);
  println(x2);

  x1 -= 0.5;
  x2 -= 0.5;

  if (x1 < -width) {
    x1 = width;
  }
  if (x2 < -width) {
    x2 = width;
  }
}
