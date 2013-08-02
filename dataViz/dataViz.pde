float x=0;
float y=0;
float a = 0;

//Define and name your image
PImage img1;
PImage img;
PImage tweet1;
PImage tweet2;
PImage tweet3;
PImage imgWeather;

float destx = 0;
float desty = 0;

int savedTime;
int totalTime = 5000;

void setup() {
  size(600, 990, P2D);
  smooth();
  destx= width/2;
  desty= height/2;
  
  // Load image
  img = loadImage("test.png");
  img1= loadImage("unionsq.png");
  tweet1 = loadImage("tweet1.png");
  tweet2 =loadImage("tweet2.png");
  tweet3=loadImage("tweet3.png");
  imgWeather=loadImage("weather.png");

  imageMode(CENTER);
  savedTime = millis();
}

void draw() {
  background(255);
  image(img1, width/2, height/2);
  image(imgWeather, width-100, 100);
  trigger();
  timer();
}

// trigger data viz elements
void trigger() {
  if (key== '1') {
    noStroke();
    fill(255, 0, 0, a);
    //ellipse(x, y, 20, 20);
    image(img, x, y);
    
    //coordinates x+y = initial start position
    //coordinates destx+ desty = ending position
    x= lerp (x, destx, 0.005);
    y= lerp(y, desty, 0.009);
  }
  
  if(key == '2'){
  //image(TESTIMAGE, newXstart, newYstart);
  //x= lerp (newXstart, newdestx, 0.005);
  //y= lerp(newYstart, newdesty, 0.009);
  
  }
  
  if (a<255) {
    a+=0.5;
  }
}

// tweets controlled by timer
void timer() {
  int passedTime = millis()-savedTime;
  if (passedTime> 2000) {
    scale(0.75);
    image(tweet1, width/2, height/2);
    if (passedTime> 4000) { 
      image(tweet3, width/4, height/4);
    }
  }
}

