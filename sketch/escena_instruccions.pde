class CubeI {
  float x, y, velocity;
  int type;
  color[] col;

  CubeI() {
    this.type = int(random(1, 8));
    this.x = 540 / 7 * this.type - (540/7/2) + 150;
    this.y = 130;
    this.velocity = 4;
    this.col = int(split(colorsCubes[this.type-1], ','));
  }

  void update() {
    rectMode(CENTER);
    noStroke();
    fill(this.col[0], this.col[1], this.col[2]);
    rect(this.x, this.y, 22, 22);
    this.y += this.velocity;
  }
}

void escena_instruccions() {
  background(31,59,77);
  textFont(font);
  fill(255, 255, 255);
  textSize(60);
  textAlign(CENTER, CENTER);
  text("instruccions", 640, 60);

  fill(0, 0, 0);
  rectMode(CENTER);
  rect(640, 630, 350, 100, 20, 20, 20, 20);
  fill(255, 255, 255);
  textSize(50);
  text("jugar", 640, 630);
  
  //Rect
  rectMode(CORNER);
  noStroke();
  fill(253,193,197);
  rect(100, 125, 640, 425);
  
  fill(100, 100, 50);
  rect(100, 450, 640, 75);
  
  stroke(0, 0, 0);
  strokeWeight(2);
  fill(0, 0, 0);
  for (int i = 1; i <= 7; i++) {
    int w = 540;
    int x = w / 7 * i - (w/7/2) + 150;
    line(x, 125, x, 550);
  }
  
  noStroke();
  fill(100, 100, 50);
  rect(100, 450, 640, 75);
    
  //Text
  textAlign(LEFT, CENTER);
  fill(255, 255, 255);
  textFont(font2);
  textSize(20);
  String instruccions = "Just quan el cuadrat estigui entre la \nfranja del rectangle inferior haurem de \ntocar la tecla amb el color del cuadrat \ncorresponent, si deixem passar el cuadrat \nperdrem punts, per el contrari els \nguanyaras! Si intentes explotar els \ncuadrats abans de que arribin a la franja \ntambe perdras punts!";
  text(instruccions, 760, 310);
  textFont(font);
  
  if (millis() - timerCubes >= 650) {
    iCubes.add(new CubeI());
    timerCubes = millis();
  }

  //Cub
  for (int i = 0; i < iCubes.size(); i++) {
    if (iCubes.get(i).y >= 540) {
      iCubes.remove(i);
      break;
    } else {
      iCubes.get(i).update();
    }
  }
}
