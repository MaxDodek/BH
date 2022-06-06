//Make For Start
void game () {
  objects.add(new Star());
  objects.add(new Enemy());
    background(0);

  int i=0;
  while (i<objects.size()) {
    GameObject o = objects.get(i);
    o.act();
    o.show();

    if (o.lives==0) {
      objects.remove(i);
    } else {
      i++;
    }
  }
  textSize(20);
  text(frameRate, 20, 20);
  text(objects.size(), 20, 40);

  player1.act();
  player1.show();
}


void gameClicks () {
  mode=GAMEOVER;
}
