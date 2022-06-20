class EnemyBullet extends GameObject {
  //variables
float angle;

  //constructor
  EnemyBullet(float x, float y, float vx, float vy, float angle) {
    super(x, y, vx, vy, 20, enemybullet, 1);//fix
    vx=10*cos(radians(-angle));
    vy=10*sin(radians(-angle));
  }

  void show() {
    pushMatrix();
    translate(x, y);
    rotate(atan2(vy, vx));
  
    image(image, 0,0, size, size);

    popMatrix();
  }
}
