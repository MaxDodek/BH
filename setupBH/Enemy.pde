class Enemy extends GameObject {
  //variables

  //constructor
  Enemy() {
    super(random(width), -20, 0, 5, 40, red, 1);
  }

  void act() {
    super.act();

    //colision code
    int i = 0;
    while (i<objects.size()) {
      GameObject obj = objects.get (i);
      if (obj instanceof Bullet) { //instanceof checks class of object. Finds out, are we coliding?
        if (collidingWith( obj)) {
          lives--;
        }
      }
      i++;
    }
    //remove offscreen
    if (offScreen()) lives = 0;
 
  }
}




//super.act();//if only want things in super class, don't need void act. Otherwise, this for connecting super class, then I add my own things.
