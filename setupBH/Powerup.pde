class Powerup extends GameObject { //also enemy droppings(bad)
  //  //variables
  int type;
  float timer;

  //constructor
  Powerup(float x, float y, int type) {
    super(x, y, random(2, -2), random(0, 2), 40, null, 1);
    this.type=type;
    timer=200;
  }


  void show() {// show for certain time only
    timer--;
    if (type == 2) image(p2bullets, x, y, size, size); // 2 bullets //how make certain amount of Powerups only???
    if (type == 3) image(p3bullets, x, y, size, size); //3 bullets
    if (type == 4) image(pfire, x, y, size, size); //fire(make 2 secs.) // how make not do more thn once
    if (type == 5) image(plives, x, y, size, size); //lives 
    if (type == 6) image(pshield, x, y, size, size); //shield 

    //enemy Droppings
    if (type == 7) image(bomb, x, y, size, size); //bomb
    //if (type == 8) objects.add(new Suiplane( x,  y,  vy)  ); //suicide plane (crash into main plane)
    if (timer<=0) lives =0;
  
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
