void escena_inicial() {
  background(0, 0, 0);
  textFont(font);
  noStroke();
  for (int i = 0; i < 1000; i++) {
    fill(random(255), random(255), random(255), random(255));
    rect(random(-100, 1380), random(-100, 820), 65, 65, 7);
  }

  fill(0, 0, 0, 220);
  rect(640, 160, 1280, 220);

  textSize(100);
  textAlign(CENTER, CENTER);
  fill(255, 255, 255);
  text("plastipiano", 640, 150);

  textSize(50);
  rectMode(CENTER);
  fill(0, 0, 0);
  rect(360, 500, 500, 150, 20, 0, 0, 20);
  fill(255, 255, 255);
  text("jugar", 360, 500);
  rect(920, 500, 500, 150, 0, 20, 20, 0); 
  fill(0, 0, 0);
  text("instruccions", 920, 500);
}
