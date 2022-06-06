abstract class GameObject { //super class(should it be abstract?)
  //instance variables
  float x, y, vx, vy;
  float size;
  float lives;
  color c;

  GameObject(float x, float y, float vx, float vy, float size, color c, int lives) {//constructor
    this.x=x; // this.x = instance variable x, x = paramenter
    this.y=y;
    this.vx=vx;
    this.vy=vy;
    this.size=size;
    this.c=c;
    this.lives=lives;
  }

  void show() {
    fill(c);
    square (x, y, size);
  }

  void act() {
      x= x+vx;
      y= y+vy;
    }
    
    
  boolean collidingWith(GameObject obj) {
    return dist(obj.x, obj.y, x, y)<obj.size/2 + size/2;//object (object.x, object.y), it's x and y. is less than sum of the radiay (perspective of enemy, our bullet) + our size
  }
    boolean offScreen() {
      return (x<0|| x>width||y<-50||y>height); //return =_____.
    }


 
  }
