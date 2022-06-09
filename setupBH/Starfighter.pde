class Starfighter extends GameObject {
  //variables
  int cooldown, threshold;
  //cooldown= timer befer shoot again-ex 60 frames beore can shoot again. How many frames has it been since last shot
  //threshold= #of frames. ex. 60

  //constructor
  Starfighter() {
    super(width/2, height/2, 0, 0, 40, red, 3000);
    threshold=30;
    cooldown=threshold;
  }

  void show() {

    image(plane, x, y, size, size);// get to work
  }

  void act() {
    super.act();
    //managing guns
    cooldown++;
    if (space && cooldown >=threshold) {
      objects.add (new Bullet());
      cooldown=0;
    }

    //controlling starfighter
    if (up) vy=-5;
    if (down) vy=5;
    if (left) vx=-5;
    if (right) vx=5;
    if (!left && !right)vx=vx*0.9;//!=not
    if (!down && !up)vy=vy*0.9;//!=not


    if (x <=0) x=0;
    if (x >=width) x=width;

    if (y <=0) y=0;
    if (y >=height) y=height;
  }
}
//cont. video at 4:18
