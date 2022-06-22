class Enemy4 extends GameObject {
  //variables
  int cooldown, threshold;


  //constructor
  Enemy4() {
    super(random(0,width/2), -20, 4, 5, 100, enemies2, 1);
    threshold=30;
    cooldown=threshold;
  }

  void act() {
    super.act();
    
    if (x>=width-200) vx=vx*-1;
    

    //colision code
    int i = 0;
    while (i<objects.size()) {
      GameObject obj = objects.get (i);
      if (obj instanceof Bullet) { //instanceof checks class of object. Finds out, are we coliding?
        if (collidingWith( obj)) {
          objects.add(new EnemyExplosion(x, y));
          lives--;
          obj.lives=0;
          player1.score++;
        }
      }
      i++;
    }
    //remove offscreen
    if (offScreen()) lives = 0;

    if ( cooldown >=threshold) {
            objects.add (new EnemyBullet(x, y, 10, 10,0));;//right
      objects.add (new EnemyBullet(x, y, -5, 10,0));//left
      objects.add (new EnemyBullet(x, y, 0, 10,0));//down

      cooldown=0;
    }
    cooldown++;
  }
}
