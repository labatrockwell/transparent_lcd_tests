class Confetti2 {
  PVector location;
  PVector velocity;
  PVector acceleration;
  int r;
  
  float r1 = 0;
  float g1 = 255;
  float b1;
  
  PImage b;

  Confetti2(int _x, int _y) {
    location = new PVector(_x, _y);
    velocity = new PVector(random(-4, 4), random(-4, 4));
    r = round(random(250, 450));
    b1 = random(150, 255);

  }

  void update() {
    location.add(velocity);
  }

  void display() {
    rectMode(CENTER);
    noStroke();
    fill(r1, g1, b1);
    ellipse(location.x, location.y, r, r);
  }

  void checkPos() {
    if (location.x + r/2 >= width && velocity.x > 0) {
      velocity.x *=-1;
    }
    else if (location.x - r/2 <= 0 && velocity.x < 0) {
      velocity.x *=-1;
    }
    else if (location.y + r/2 >= height && velocity.y > 0) {
      velocity.y *=-1;
    }
    else if (location.y - r/2 <= 0 && velocity.y <0) {
      velocity.y *=-1;
    }
  }
}

