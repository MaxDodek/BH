class Star extends GameObject {




  //consturctor - setup for each instance variable (constructs our star). Can't have void, must have name of class, and then brackents and {
  Star() {
    super(random(width), 0, 0, 0, random(1, 5), null, 1);//for random, don't neeed 0-width, ljust need width. it assumes start as 0
    vy= size; // just need to do this manually, vy must be after size function to work properly
  }

  void show(){
  square (x, y, size);
  }


  void act() {
    super.act();
    if (y>height) {
      lives=0;
    }
  }
}
