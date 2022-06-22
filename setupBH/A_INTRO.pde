void intro () {
  //intro gif
  image(intro[f1], width/2, height/2, width, height);
  if (frameCount % 2==0) f1++;
  if (f1==iframes-1) f1=0;

  textSize(100);
  text("Bullet Hell", width/2, height/2);
  textSize(30);
  text("Click Anywhere To Play!", width/2, height/2+100);
}

void introClicks () {
  mode=GAME;
}
