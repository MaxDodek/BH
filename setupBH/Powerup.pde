class Powerup extends GameObject {
  //  //variables
  int type;

  //constructor
  Powerup(float x, float y, int type) {
    super(x, y, random(2, -2), random(0, 2), 20, null, 1);
    this.type=type;
  }


  void show() {// show for certain time only
    if (type == 2) image(powerup, x, y, size, size); // lives
    if (type == 3) image(powerup, x, y, size, size); // bullet speed
    if (type == 4) image(powerup, x, y, size, size); //shield
  }


  void act() {// have power for certain time only
    x= x+vx;
    y= y+vy;
    if (x<=0) vx*=-1;
    if (x>=width) vx*=-1;
    if (y<=0)vy*=-1;
    if (y>=height) vy*=-1;
  }
}
