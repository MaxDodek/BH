class Shield extends GameObject { //not going to use. Too complex (for now).
  int timer;

  //consturctor - setup for each instance variable (constructs our star). Can't have void, must have name of class, and then brackents and {
  Shield(float x, float y) {
    super(x, y, 0, 0, 80, pshield, 1); //figure out how make work
    x=player1.x;
    y=player1.y;
    timer=200;
  }

  void show() {
    image(pshield, x, y, size, size);
    timer--;
  }
  void act() { //how make work???
    if (timer<=0)lives=0;

    x= x+vx;
    y= y+vy;
    //bullet collision
    int i = 0;
    while (i<objects.size()) {
      GameObject obj = objects.get (i);
      if (obj instanceof EnemyBullet) {
        if (collidingWith( obj)) {
          obj.lives=0;
        }
      }
      i++;
    }

    //enemy collision
    i = 0;
    while (i<objects.size()) {
      GameObject obj = objects.get (i);
      if (obj instanceof Enemy||obj instanceof Enemy2||obj instanceof Enemy3||obj instanceof Enemy4) {
        if (collidingWith( obj)) {
          obj.lives=0;
          player1.score++;
          objects.add(new EnemyExplosion(x, y));
        }
      }
      i++;
    }



    //move
    if (up) vy=-5;
    if (down) vy=5;
    if (left) vx=-5;
    if (right) vx=5;
    if (!left && !right)vx=vx*0.9;//!=not
    if (!down && !up)vy=vy*0.9;//!=not


    if (x <=0+20) x=0+20;
    if (x >=width-20) x=width-20;

    if (y <=0+20) y=0+20;
    if (y >=height-20) y=height-20;
  }
}
