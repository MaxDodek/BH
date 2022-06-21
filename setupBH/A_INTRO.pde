void intro () {
  background(0);
  textSize(100);
  text("Bullet Hell", width/2, height/2);


  //image(explode[f], x, y, size, size);
  //if (frameCount % 2==0) f++;
  //if (f==nframes-1) lives=0;
}

void introClicks () {
  mode=GAME;
}
