// Learning Processing
// Daniel Shiffman
// http://www.learningprocessing.com

// Example 8-2: Two Car objects

Car myCar1;
Car myCar2; // Two objects!
Car myCar3;
Car myCar4;

PImage img;


void setup() {
  size(1980, 1200);
  smooth();

  myCar1 = new Car(color(0), 0, 150, 2); // Parameters go inside the parentheses when the object is constructed.
  myCar2 = new Car(color(255), 0, 430, 1);
  myCar3 = new Car(color(0), 0, 700, 3);
  myCar4 = new Car(color(255), 0, 900, 0.5);
  img = loadImage("gradient4.png");
}

void draw() {
  //background(150, 200, 150);
  image(img, 0, 0);

  myCar1.move();
  myCar1.display();
  myCar2.move();
  myCar2.display();
  myCar3.move();
  myCar3.display();
  myCar4.move();
  myCar4.display();
}

class Car { // Even though there are multiple objects, we still only need one class. No matter how many cookies we make, only one cookie cutter is needed.Isn’t object-oriented programming swell?
  color c;
  float xpos;
  float ypos;
  float xspeed;
  PImage portImg;
  
  Car(color tempC, float tempXpos, float tempYpos, float tempXspeed) { // The Constructor is defined with arguments.
    c = tempC;
    xpos = tempXpos;
    ypos = tempYpos;
    xspeed = tempXspeed;
    portImg = loadImage("portImg.png");
  }

  void display() {
    //stroke(0);
    fill(c);
    noStroke();
    rectMode(CENTER);
    rect(xpos, ypos, 600, 150);
    image(portImg, xpos, ypos);
  }

  void move() {
    xpos = xpos + xspeed;
    if (xpos > width) {
      xpos = 0;
    }
  }
}

 

