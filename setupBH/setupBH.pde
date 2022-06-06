///Max Dodek
//2.3 Computer Programming 11 - may be last project of the year - try to make it my best piece, extremely organized
//May 24, 2022
// "Bullet Hell"(BH) Project


//colour variables
color yellow = #D6FF00;
color lightblue = #3F636F;
color green = #A9C22C;
color darkblue = #4C575A;
color black = #000000;
color white= #FFFFFF;
color grey = #4D4E48;
color red = #FF0000;
color spaceship =#00b3f2;

//keyboard variables
boolean right, left, up, down, space;


//Game variables
int x, y;
Starfighter player1;
PImage plane;



//where should be organized??? Ask to look at his organizing code
int n =1000;
ArrayList<GameObject> objects;

//mode framework
int mode;
final int INTRO =1;
final int GAME = 2;
final int PAUSE =3;
final int GAMEOVER = 4;

//=================================================================================================================
void setup() {
  //basic setup
  size (1000, 800);
  //fullScreen();
  rectMode(CENTER);
  imageMode(CENTER);

  colorMode(HSB);
  textAlign(CENTER);
  noStroke();
  mode = INTRO;

  //initialize keyboard var
  left=right=up=down=space=false;

  //initialize game var
  player1 = new Starfighter();

  plane=loadImage("spaceship.png"); //if want new spaceship https://www.google.com/search?q=spaceship%20video%20game&tbm=isch&tbs=ic:trans&hl=en&sa=X&ved=0CAMQpwVqFwoTCOjZtbrDivgCFQAAAAAdAAAAABAC&biw=1440&bih=764#imgrc=I6PVJyodLbHwKM





  //ripples = new Ripple[n];
  objects = new ArrayList<GameObject>();
}

//=================================================================================================================

void draw () { // After draw, I can do void intro, void game, etc. instead of using tabs
  if (mode==INTRO) {
    intro();
  } else if (mode ==GAME) {
    game();
  } else if (mode == PAUSE) {
    pause();
  } else if (mode == GAMEOVER) {
    gameover ();
  } else {
    println("Mode error:"+ mode);
  }
}
