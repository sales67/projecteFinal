

void pantallaInicial(){
  plataforms();
  opacity();
  textDraw();
  btnImage();
}

void opacity(){
  fill(128, 128, 128, 60);
  noStroke();
  beginShape();
  vertex(0, 246);
  vertex(110, 232);
  vertex(610, 226);
  vertex(720, 229);
  vertex(720, 1000);
  vertex(0, 1000);
  endShape();
  //
  fill(128,128,128, 126);
  noStroke();
  beginShape();
  vertex(0, 258);
  vertex(145, 245);
  vertex(610, 242);
  vertex(720, 245);
  vertex(720, 1000);
  vertex(0, 1000);
  endShape();
  noTint();
}

void plataforms( ){
  //Barra gran
  image(plataforma, 0,842, width, 159);
  image(plataforma, 18,713, 120, 27);
  image(plataforma, 387,713, 120, 27);
  image(plataforma, 202,636, 120, 27);
  image(plataforma, 422,530, 120, 27);
  image(plataforma, 135,425, 120, 27);
  image(plataforma, 554,316, 120, 27);
}

void btnImage( ){
  image(botoImg, 331, 392, 205, 205);
}

void textDraw( ) {
  textFont(myFont);
  textSize(50);
  fill(204, 163, 0);
  text("MOVE YOUR", 150, 135);
  text("HAND TO CONTROL", 15, 201);
  textSize(40);
  text("PRESS", 129, 527);
  fill(204, 204, 204);
  textSize(50);
  text("MOVE YOUR", 160, 128);
  text("HAND TO CONTROL", 25, 191);
  textSize(40);
  text("PRESS", 133, 519);
}
