void gameover() {

  background (red);
  textSize(100);
  text("Game Over ", width/2, height/2-100);
  
  textSize(35);
  text("Click Mouse To Continue ", width/2, height/2);
}
void gameoverClicks () {
  setup();
  mode=INTRO;
}
