import spacebrew.*;
String server="sandbox.spacebrew.cc";
String name="givemeabettername";
String description ="This is an example client which .... It also listens to...";

Spacebrew spacebrewConnection;

int numBalls;
ArrayList balls;

int numConfettis;
ArrayList confettis;
int pressCount = 0;

void setup() {
  size(1880, 1200, P3D);
  smooth();
  background(0);
  balls = new ArrayList();
  confettis = new ArrayList();
  //frameRate(30);


  //spacebrew call
  spacebrewConnection = new Spacebrew( this );
  spacebrewConnection.addSubscribe( "Purple Bubble", "boolean" );
  spacebrewConnection.addSubscribe( "Blue Bubble", "boolean" );
  // connect!
  spacebrewConnection.connect("ws://"+server+":9000", name, description );
}

void onBooleanMessage( String name, boolean value ) {

  if (name.equals ("Purple Bubble"))
  {
    makeBubbles(1);
  }
  else {
    makeBubbles(2);
  }
}

void draw() {
  background(0);
  blendMode(ADD);

  for (int i=0;i<confettis.size();i++) {
    Confetti1 thisConfetti1 = (Confetti1) confettis.get(i);
    thisConfetti1.checkPos();
    thisConfetti1.update();
    thisConfetti1.display();
  }
  
  for (int i=0;i<balls.size();i++) {
    Confetti2 thisConfetti2 = (Confetti2) balls.get(i);
    thisConfetti2.checkPos();
    thisConfetti2.update();
    thisConfetti2.display();
  }
  
  if (mousePressed == true) {
    noCursor();
  }
}

// make bubbles!
void makeBubbles(int n) {
  if (n == 1) {
    for (int i = 0;i<3;i++) {
      confettis.add(new Confetti1(mouseX, mouseY));
    }
  }

  if (n == 2) {
    for (int i = 0;i<3;i++) {
      balls.add(new Confetti2(mouseX, mouseY));
    }
  }
}





void keyPressed() {
  makeBubbles(key - '0');
}




class Ball {
  PVector location;
  PVector velocity;
  PVector acceleration;
  int r;
  color c;
  int dia;
  PImage b;
  PImage f;
  PImage z;
  PImage y;
  PImage x;

  Ball(int _x, int _y) {
    location = new PVector(_x, _y);
    velocity = new PVector(random(-3, 3), random(-3, 3));
    r = round(random(40, 170));
    b = loadImage("0.png");
    z = loadImage("9.png");
    y = loadImage("8.png");
    x = loadImage("7.png");
  }

  void update() {
    location.add(velocity);
  }

  void display() {
    image(b, location.x, location.y, r, r);
    //image(z, location.x+50, location.y+20, r, r);
    //image(y, location.x-75, location.y+80, r, r);
    //image(x, location.x+80, location.y-40, r, r);
  }

  void checkPos() {
    if (location.x > width-r/2) {
      velocity.x *=-1;
    }
    else if (location.x < 0+r/2) {
      velocity.x *=-1;
    }
    else if (location.y > height-r/2) {
      velocity.y *=-1;
    }
    else if (location.y < 0+r/2) {
      velocity.y *=-1;
    }
  }
}

