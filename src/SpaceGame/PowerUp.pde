class PowerUp {
  // Member Variables
  int x,y,diam,speed;
  char type;
  color c1;
  //PImage r1;
  
  
  // Constructor
  PowerUp() {
   x = int(random(width));
   y = -100;
   diam = 100;
    speed = 5;
    if(random(10)>6.6) {
      //r1 = loadImage("rock01.png");
      type = 'H';
      c1 = color(0,255,0);
    } else if(random(10)>5) {
      //r1 = loadImage("rock02.png");
       type = 'T';
      c1 = color(234,33,22);
    } else {
      //r1 = loadImage("rock03.png");
       type = 'A';
      c1 = color(20,22,222);
      }
    }
  
  
  // Member Methods
 void display() {
   fill(c1);
   ellipse(x,y,diam,diam);
   fill(255);
   text(type,x,y);
  //imageMode(CENTER);
  //if(diam<1) {
    //diam = 10;
  }
  //r1.resize(diam, diam);
  //image(r1,x,y);

  void move() {
     y = y + speed;
  }
  
    boolean intersect(Spaceship s) {
    float d = dist(x,y,s.x,s.y);
    if(d<50) {
      return true;
    } else {
      return false;
    }
  }
  
}
