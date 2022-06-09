class Enemy4 extends GameObject {
  //variables
  int cooldown, threshold;


  //constructor
  Enemy4() {


    super(random(width), -20, 0, 5, 40, lightblue, 1);
    threshold=30;
    cooldown=threshold;
  }

  void act() {
    super.act();

    //colision code
    int i = 0;
    while (i<objects.size()) {
      GameObject obj = objects.get (i);
      if (obj instanceof Bullet) { //instanceof checks class of object. Finds out, are we coliding?
        if (collidingWith( obj)) {
          objects.add(new EnemyExplosion(x, y));

                    lives--;
          obj.lives=0;
        }
      }
      i++;
    }
    //remove offscreen
    if (offScreen()) lives = 0;

    if ( cooldown >=threshold) {
      objects.add (new EnemyBullet(x, y, 5, 5));//right
      objects.add (new EnemyBullet(x, y, -5, 5));//left
      objects.add (new EnemyBullet(x, y, 0, 10));//down

      cooldown=0;
    }
    cooldown++;
  }
}