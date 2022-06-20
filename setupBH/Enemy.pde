class Enemy extends GameObject {
  //variables
  int cooldown, threshold;


  //constructor
  Enemy() {
    super(random(width), -20, 0, 5, 40, enemies, 1);
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
        if (collidingWith(obj)) {
          objects.add(new EnemyExplosion(x, y));
          lives--;
          obj.lives=0;
          player1.score++;
          //objects.add(new Powerup( x, y,  7)  );// Take away once done testing
          objects.add(new Powerup( x, y, int (random(2, 10)) ) );
        }
      }
      i++;
    }


    //remove offscreen
    if (offScreen()) lives = 0;

    if ( cooldown >=threshold) {
      objects.add (new EnemyBullet(x, y, 0, 10, 0));
      cooldown=0;
    }
    cooldown++;
  }
}
