///Max Dodek
//2.3 Computer Programming 11 - may be last project of the year - try to make it my best piece, extremely organized
//May 24, 2022
// "Bullet Hell"(BH) Project


import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;





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
Shield shield;

PImage lives;
PImage coin;

//  for gif- explosion
PImage [] explode, intro, pause, gameover;
int nframes; //number of frames


//intro gif
int f1=0;
int iframes;

//pause gif
int f2=0;
int pframes;





//images for charachters
PImage plane, enemies1, enemies2, bullet, enemybullet;
//Powerups
PImage plives, p2bullets, p3bullets, pfire, pshield;
//Enemy Droppings
PImage bomb;



//sound variables
Minim minim;
AudioPlayer eexplode, epowerup;

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
  mode = INTRO;

  size (1000, 800);
  //fullScreen();
  rectMode(CENTER);
  imageMode(CENTER);

  colorMode(HSB);
  textAlign(CENTER);
  noStroke();

  //initialize keyboard var
  left=right=up=down=space=false;

  //initialize game var
  player1 = new Starfighter();

  //images for charachters
  plane=loadImage("goodplane.png"); //if want new spaceship https://www.google.com/search?q=spaceship%20video%20game&tbm=isch&tbs=ic:trans&hl=en&sa=X&ved=0CAMQpwVqFwoTCOjZtbrDivgCFQAAAAAdAAAAABAC&biw=1440&bih=764#imgrc=I6PVJyodLbHwKM
  enemies1=loadImage("badplane2.png");
  enemies2=loadImage("badplane.png");
  bullet=loadImage("goodbullet.png");
  enemybullet=loadImage("laser.png");
  //powerups
  plives=loadImage("powerup.png");
  p2bullets=loadImage("2bullet.png");
  p3bullets=loadImage("3bullet.png");
  pfire=loadImage("fire.png"); //chose different/delete (not working)
  pshield=loadImage("shield.png");
  //enemy droppings
  bomb=loadImage("bomb.png");

  //scoreboard
  lives=loadImage("heart.png");
  coin=loadImage("coin.jpeg");

  //sounds
  minim = new Minim(this);
  eexplode = minim.loadFile("scream.wav");
  epowerup = minim.loadFile("powerup.mp3");

  //load gifs
  gifs();

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

//=================================================================================================================

void gifs() {
  //explosion gif
  nframes= 18;
  explode = new PImage [nframes];
  int i=0;
  while (i<nframes) {
    explode[i]=loadImage("frame_"+i+"_delay-0.8s.gif");
    i++;
  }

  // Intro gif
  iframes= 25;
  intro = new PImage [iframes];
  i=0;
  while (i<iframes) {
    intro[i]=loadImage("frame_"+i+"_delay-0.07s.gif");
    i++;
  }
}
