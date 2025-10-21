class Spaceship {
  // Member Variables
  int x,y,w, laserCount, turretCount, health;
  PImage ship;
  
  // Constructor
  Spaceship() {
    x = width/2;
    y = height/2;
    w = 100;
    laserCount = 1000;
    turretCount = 1;
    health = 100;
    ship = loadImage("New Piskel (3).png");
  }
  
  // Member Methods
  void display() {
    imageMode(CENTER);
   line(x,y+90,x,y);
stroke(222);
strokeWeight(3);
fill(70);
line(x-25,y+30,x+25,y+30);
rectMode(CENTER);
fill(200);
rect(x,y,80,20);
fill(100);
ellipse(x,y,20,80);
triangle(x,y-30,x-30,y+20,x+30,y+20);
triangle(x,y+30,x-20,y+10,x+20,y+10);

  }
  
  void move(int x, int y) {
    this.x = x;
    this.y = y;
  }
  
  boolean fire() {
    if(laserCount>0) {
      return true;
    } else {
      return false;
    }
  }
  
  boolean intersect(Rock r) {
    float d = dist(x,y,r.x,r.y);
    if (d<50) {
      return true;
    }else {
      return false;
    }
  }
}
