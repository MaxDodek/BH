//Make For Start
void game () {

  background(0);
  addObjects();
  gameEngine();
  debug();
  board();


  player1.act();//where this go?
  player1.show(); //where this go?
}

void addObjects() {
  objects.add(new Star());

  if (frameCount%50 ==0)objects.add(new Enemy());
  if (frameCount%150 ==0)objects.add(new Enemy2());
  if (frameCount%200 ==0)objects.add(new Enemy3());
  if (frameCount%250 ==0)objects.add(new Enemy4());
}

void gameEngine() {
  int i=0;
  while (i<objects.size()) {
    GameObject obj = objects.get(i);
    obj.act();
    obj.show();

    if (obj.lives==0) {
      objects.remove(i);
    } else {
      i++;
    }
  }
}

void debug() {
  textSize(20);
  text(frameRate, 20, 20);
  text(objects.size(), 20, 40);
}
void board() {
  fill(white);
  textSize(20);
  text("Lives:"+player1.lives, width/2, 20);//how conect lives to here, + make global function
  text("Score:" + player1.score, width/2, 40);//how conect lives to here, + make global function
}

void gameClicks () {
  //mode=PAUSE;
}
