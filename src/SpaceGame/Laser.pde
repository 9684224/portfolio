class Laser {
  // Member Variables
  int x,y,w,h,speed;
  PImage laser;
  
  // Constructor
  Laser(int x, int y) {
   this.x = x;
   this.y = y;
    w = 6;
    h = 12;
    speed = 5;
    laser = loadImage("laser.png");
  }
  
  // Member Methods
  void display() {
    imageMode(CENTER);
    image(laser,x,y);
  }
  
  void move() {
   y = y - speed;
  }
  
  void fire() {
  }
  
  boolean reachedTop() {
    if(y<-20) {
      return true;
    } else {
    return false;
  }
  }
  
  boolean intersect(Rock r) {
    float d = dist(x,y,r.x,r.y);
    if(d<50) {
      return true;
    } else {
      return false;
    }
  }
}
