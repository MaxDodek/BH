boolean isClicking (float x, float y, float w, float h) {
  if (mouseX > x - w/2 && mouseX< x + w/2 && mouseY> y - h/2 && mouseY<y+h/2) {
    return true;
  } else {
    return false;
  }
}

void keyPressed() {
  if (keyCode == LEFT) left=true; //make sure work propperly
  if (keyCode ==RIGHT) right=true;

  if (keyCode == UP) up=true;
  if (keyCode ==DOWN) down=true;


  if (keyCode == ' ') space=true;
}

void keyReleased() {
  if (keyCode == LEFT) left=false;
  if (keyCode ==RIGHT) right=false;

  if (keyCode == UP) up=false;
  if (keyCode ==DOWN) down=false;

  if (keyCode ==' ') space=false;
}

void mouseReleased() {

  if (mode==INTRO) {
    introClicks();
  } else if (mode ==GAME) {
    gameClicks();
  } else if (mode == PAUSE) {
    pauseClicks();
  } else if (mode == GAMEOVER) {
    gameoverClicks();
  }
}
