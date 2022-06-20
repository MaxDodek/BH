class Bullet extends GameObject {


  //consturctor - setup for each instance variable (constructs our star). Can't have void, must have name of class, and then brackents and {
  Bullet(float x, float y) {
    super(x,y,0,-10,20,bullet,1);
  }


  
}
