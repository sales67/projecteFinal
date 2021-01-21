class Cube {
  float x, y, velocity;
  int type;
  color[] col;

  Cube() {
    this.type = int(random(1, 8));
    this.x = 1280 / 7 * this.type - (1280/7/2);
    this.y = 0;
    this.velocity = 4.5;
    this.col = int(split(colorsCubes[this.type-1], ','));
  }

  void update() {
    rectMode(CENTER);
    noStroke();
    fill(this.col[0], this.col[1], this.col[2]);
    rect(this.x, this.y, 40, 40);
    this.y += this.velocity;
  }
}

void escena_joc() {
  background(12, 200, 30);
  textFont(font);

  seconds = startTime - millis()/1000;

  //TEXTS
  textSize(25);
  textAlign(LEFT, CENTER);
  fill(0, 0, 0);
  text(seconds, 10, 20); 
  textAlign(RIGHT, CENTER);
  text(score, 1270, 20);

  //LINIES
  stroke(1);
  strokeWeight(3);
  for (int i = 1; i <= 7; i++) {
    int w = 1280;
    int x = w / 7 * i - (w/7/2);
    line(x, 0, x, 720);
  }

  rectMode(CORNER);
  fill(255, 255, 255);
  rect(0, 550, 1280, 100);
  line(0, 550, 1280, 550);
  line(0, 650, 1280, 650);

  if (millis() - timerCubes >= 1000) {
    cubes.add(new Cube());
    timerCubes = millis();
  }

  //Cub
  for (int i = 0; i < cubes.size(); i++) {
    if (cubes.get(i).y >= 700) {
      if(score > 0) score -= 5;
      cubes.remove(i);
      wrong.play();
      break;
    } else if (cubes.get(i).y >= 550 && cubes.get(i).y <= 650) {
      cubes.get(i).update();
      if (cubes.get(i).type == keyClicked) {
        score += 20;
        blocs++;
        keyClicked = -1;
        cubes.remove(i);
        break;
      }
    } else {
      if (cubes.get(i).type == keyClicked) {
        if(score > 0) score -= 5;
        keyClicked = -1;
        wrong.play();
        cubes.remove(i);
        break;
      }
      cubes.get(i).update();
    }
  }
}
