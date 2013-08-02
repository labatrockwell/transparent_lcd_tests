float time=0;
boolean stop=false;
PImage img;

void setup() {
  size(1000, 600);
  frameRate(25);
  img = loadImage("pattern1.png");
  smooth();
}

void draw() {
  if (!stop)doDraw();
}

void mousePressed() {
  stop=!stop;
}

void doDraw() {
  background(255);
  translate(width/2, height);
  imageMode(CENTER);
  time+=.009;
  rotate(time);
  scale(0.75);
  image(img, 0, 0);
}

