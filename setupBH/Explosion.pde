class Explosion extends GameObject { //Ask how fix

  //variables
  int cooldown, threshold;
  int f;
  //constructor
  Explosion(float x, float y) {
    super(x, y, 0, 0, 400, explode[0], 1);//why not working?
        f=0;
  }


  void show() {
    image(explode[f], x, y, size, size);
    if (frameCount % 2==0) f++;
    if (f==nframes-1) lives=0;
  }
}
