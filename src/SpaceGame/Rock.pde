class Rock {
  // Member Variables
  int x,y,diam,speed;
  PImage r1;
  
  
  // Constructor
  Rock() {
   x = int(random(width));
   y = -100;
   diam = int(random(10,100));
    speed = int(random(1,10));
    if(random(10)>7) {
      r1 = loadImage("rock01.png");
    } else if(random(10)>5) {
      r1 = loadImage("rock02.png");
    } else {
      r1 = loadImage("rock03.png");
      }
    }
  
  
  // Member Methods
 void display() {
  imageMode(CENTER);
  if(diam<1) {
    diam = 10;
  }
  r1.resize(diam, diam);
  image(r1,x,y);
 }
  void move() {
     y = y + speed;
  }
  
  boolean reachedBottom() {
    if(y>height+diam) {
      return true;
    }else {
      return false;
    }
  }
  
}
