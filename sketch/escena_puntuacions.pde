void escena_puntuacions() {
  background(12, 10, 20);
  textFont(font);

  fill(255, 255, 255, 30);
  rect(0, 200, 1280, 520);

  //Titol
  fill(0, 102, 153);
  textSize(50);
  textAlign(CENTER, CENTER);
  text("puntuacions", 640, 70); 

  //Puntuacio
  fill(255, 255, 255);
  textSize(23);
  text("tens una puntuacio de " + score + " punts amb un total de " + blocs + " blocs destruits", 640, 150);

  //Puntuacions
  rectMode(CENTER);
  int w = 1280;
  int c = scoreSort.length - 1;
  int index = 1;

  for (int i = 1; i <= 3; i++) {
    for (int j = 1; j <= 3; j++) {
      int x = w / 3 * i - (w/3/2)-100;
      int y = 150+(j*125);

      if (i == 1) {
        if (j == 1) fill(201, 176, 55);
        else if (j == 2) fill(180, 180, 180);
        else fill(173, 138, 86);
      } else {
        fill(31, 167, 116);
      }
      rect(x, y, 100, 100);

      //Puntuacio
      textAlign(LEFT, CENTER);
      textSize(35);
      fill(255, 255, 255);
      if (c >= 0)text(scoreSort[c], x+75, y);
      else text("-", x+75, y);
      c--;

      //Num
      textAlign(CENTER, CENTER);
      textSize(50);
      fill(0, 0, 0);
      text(index, x, y);
      index++;
    }
  }

  //Boto Tornar a jugar
  fill(0, 0, 0);
  rect(640, 640, 350, 100, 20, 20, 20, 20);

  fill(255, 255, 255);
  textAlign(CENTER, CENTER);
  textSize(30);
  text("torna a jugar", 640, 640);
  rectMode(CORNER);
}

private int[] sortScores(String[] strings) {
  int[] scoreSort = new int[strings.length];
  int s = 0;
  for (String str : strings) {
    scoreSort[s] = Integer.parseInt(str);//Exception in this line
    s++;
  }

  Arrays.sort(scoreSort);
  return scoreSort;
}
