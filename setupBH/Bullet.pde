class Bullet extends GameObject {


  //consturctor - setup for each instance variable (constructs our star). Can't have void, must have name of class, and then brackents and {
  Bullet() {
    super(player1.x,player1.y,0,-10,5,spaceship,1);
  }

  void show() { //if I leave this blank, it will be what it is in my super class. code here overides super class
    fill(c);
    square (x, y, size);
  }


  void act() {
    super.act();
    if (offScreen()) lives = 0;
  }
}
