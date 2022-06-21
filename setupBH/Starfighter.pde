class Starfighter extends GameObject { //why not working??
  //variables
  int cooldown, threshold;
  int score, timer;
  int gunmode;


  //constructor
  Starfighter() {
    super(width/2, height/2, 0, 0, 40, plane, 250);
    threshold=30;
    cooldown=threshold;
    score=0;
    gunmode=1;
    rectMode(CENTER);
  }

  void show() {
    image(plane, x, y, size, size);
  }




  void act() {
    super.act();
    timer--;



    //managing guns
    cooldown++;
    if (space && cooldown >=threshold) {
      shoot();
      cooldown=0;
    }



    ////Bullet colision code. usually, when game frozen, it's usually because of an infinite loop (need i ++)
    int i = 0;
    while (i<objects.size()) {
      GameObject obj = objects.get (i);
      if (obj instanceof EnemyBullet) { //instanceof checks class of object. Finds out, are we coliding?
        if (collidingWith( obj)) {
          obj.lives=0; // keep bullet sometimes taking more lives. Makes better. Just start w/more lives
          lives--;
          objects.add(new EnemyExplosion(x, y));
        }
      }
      i++;
    }

    //enemy Collision Code
    i = 0;
    while (i<objects.size()) {
      GameObject obj = objects.get (i);
      if (obj instanceof Enemy||obj instanceof Enemy2||obj instanceof Enemy3||obj instanceof Enemy4) {
        if (collidingWith( obj)) {
          obj.lives=0;
          lives--;
          score++;
          objects.add(new EnemyExplosion(x, y));
        }
      }
      i++;
    }

    //Powerup Collision Code //Must fix !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    i = 0;
    while (i<objects.size()) {
      GameObject obj = objects.get (i);
      if (obj instanceof Powerup) {
        Powerup p =(Powerup) obj; //creating another object p, making it = obj, but convert it to a powerup object
        if (collidingWith( obj)) {

          timer=200;

          if (p.type ==2) gunmode=2; //2 bullets
          if (p.type ==3) gunmode=3; //3 bullets
          if (p.type==4) { //fire
            timer=50;
            gunmode=4;
          }
          if (p.type ==5) lives=lives+5; //lives
          if (p.type ==6) {//shield (not work aggainst bomb)
            timer=200;
            objects.add(new Shield(x, y));
            if (timer<=0) lives=0;
          }


          //bad (from enemy)
          if (p.type==7) { //bomb
            lives=lives-5;
            objects.add(new Explosion(x, y));
          }

          obj.lives=0;
        }
      }
      i++;
    }


    // //enemy Droppings
    //    if (type == 7) image(bomb, x, y, size, size); //bomb
    //    if (type == 8) image(suiplane, x, y, size, size); //suicide plane (crash into main plane)
    //  }


    //controlling starfighter
    if (up) vy=-5;
    if (down) vy=5;
    if (left) vx=-5;
    if (right) vx=5;
    if (!left && !right)vx=vx*0.9;//!=not
    if (!down && !up)vy=vy*0.9;//!=not


    if (x <=0+size/2) x=0+size/2;
    if (x >=width-size/2) x=width-size/2;

    if (y <=0+size/2) y=0+size/2;
    if (y >=height-size/2) y=height-size/2;


    //dying
    if (lives<=0) {
      lives=10;
      mode=GAMEOVER;
    }
  }



  void shoot() {

    if (gunmode==1) {
      objects.add (new Bullet(x, y));
    } else if (gunmode ==2) {
      objects.add (new Bullet(x+10, y));
      objects.add(new Bullet(x-10, y));
      if (timer<=0)gunmode =1;
    } else if (gunmode == 3) {
      objects.add (new Bullet(x+10, y));
      objects.add (new Bullet(x, y));
      objects.add(new Bullet(x-10, y));
      if (timer<=0)gunmode =1;
    } else if (gunmode == 4) {
      objects.add (new Bullet(x, y));
      threshold=0;
      if (timer<=0) threshold =30;
    }
  }
}

//void bomb() {
//  lives=lives-5;
//  objects.add(new EnemyExplosion(x, y));
//}
