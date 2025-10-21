 // Hunter Westover | 23 Sept 2025 | SpaceGame
Spaceship G1;
ArrayList<PowerUp> powups = new ArrayList<PowerUp>();
ArrayList<Rock> rocks = new ArrayList<Rock>();
ArrayList<Laser> lasers = new ArrayList<Laser>();
ArrayList<Star> stars = new ArrayList<Star>();
Timer rockTimer, puTimer;
int score, rocksPassed, level, rtime;
boolean play;



void setup() {
  size(500, 500);
  rtime = 2000;
  G1 = new Spaceship();
  puTimer = new Timer(5000);
  puTimer.start();
  rockTimer = new Timer(rtime);
  rockTimer.start();
  score = 0;
  rocksPassed = 0;
  play = false;
  level = 1;
}

void draw() {
  if(play == false) {
    startScreen();
  }else{
  background(0);
  
   //Distributes a powerup on a timer
  if (puTimer.isFinished()) {
    powups.add(new PowerUp());
    puTimer.start();
  }
  
  for (int i = 0; i < powups.size(); i++) {
    PowerUp pu = powups.get(i);
    pu.move();
    pu.display();
    // collision detection between rock and ship
    if(pu.intersect(G1)) {
     // Remove Powerup
     powups.remove(pu);
     // Based on type, benefit user
     if(pu.type == 'H') {
       G1.health+=100;
     } else  if(pu.type == 'T') {
       G1.turretCount+=1;
       if(G1.turretCount>3) {
         G1.turretCount = 3;
       } 
     } else  if(pu.type == 'A') {
       G1.laserCount+=100;
     }
    }
  }
   
  
  //Adding Stars
  stars.add(new Star());
   //Distribute Rocks
  if (rockTimer.isFinished()) {
    rocks.add(new Rock());
    rockTimer.start();
  }
  
  
  // Display of starss
  for (int i = 0; i < stars.size(); i++) {
    Star star = stars.get(i);
    star.display();
    star.move();
    if (star.reachedBottom()==true) {
      stars.remove(star);
    }
  }
// Display of rocks
  for (int i = 0; i < rocks.size(); i++) {
    Rock rock = rocks.get(i);
    // collision detection between rock and ship
    if(G1.intersect(rock)) {
      rocks.remove(rock);
      score+=rock.diam;
      G1.health-=10;
    }
    rock.display();
    rock.move();
    if (rock.reachedBottom()==true) {
      rocks.remove(rock);
      i--;
      score = score + rock.diam;
      rocksPassed++;
      G1.health = G1.health - 2;
    }
  }
  //display of lasers
   for (int i = 0; i < lasers.size(); i++) {
    Laser laser = lasers.get(i);
    for (int j = 0; j<rocks.size(); j++) {
      Rock r = rocks.get(j);
      if(laser.intersect(r)) {
        // Reduce hit points on rock
        r.diam = r.diam - 15;
        if(r.diam<5) {
          rocks.remove(r);
        }
        // Remove Laser
        lasers.remove(laser);
        // Do something
        score = score + 10;
        // Provide animated Gif and explosion sound
      }
      
    }
    laser.display();
    laser.move();
    if (laser.reachedTop()) {
      lasers.remove(laser);
    }
    println(lasers.size());
  }

  for (int i = 0; i < lasers.size(); i++) {
    Laser laser = lasers.get(i);
    laser.display();
    laser.move();
    if (laser.reachedTop()==true) {
      lasers.remove(laser);
    }
  }
  //println(rocks.size());

  G1.display();
  G1.move(mouseX, mouseY);
  
  infoPanel();
  }
  //Level Indicater
  if(rocksPassed>10) {
    level++;
    rtime-=10;
  } else if (rocksPassed>20) {
    level++;
  }
  //Game Over criteria
  if(G1.health<1){
    gameOver();
  }
}

void mousePressed() {
  //laser.play();
  if(G1.turretCount == 1) {
    lasers.add(new Laser(G1.x, G1.y));
  } else if(G1.turretCount == 2) {
    lasers.add(new Laser(G1.x-10, G1.y));
    lasers.add(new Laser(G1.x+10, G1.y));
  } else if(G1.turretCount == 3) {
    lasers.add(new Laser(G1.x, G1.y));
    lasers.add(new Laser(G1.x-10, G1.y));
    lasers.add(new Laser(G1.x+10, G1.y));
  }
  if(G1.fire()) {
  lasers.add(new Laser(G1.x, G1.y));
  G1.laserCount--;
  }
}

void infoPanel() {
  rectMode(CENTER);
  fill(127,127);
  rect(width/2,25,width,50);
  fill(220);
  textSize(25);
  text("Score:" + score, 20, height-20);
  text("Passed Rocks: " + rocksPassed, width-200,40);
  text("Health: " + G1.health, 350, height-20);
  text("Ammo: " + G1.laserCount, 200, height-20);
  fill(255);
  text("Level: " + level, 100,100);
  fill(255);
  rect(50,height-100,100,10);
  fill(255,0,0);
  rect(50,height-100,G1.health,10);
}

void startScreen() {
 loadImage("Start.png");
  if(mousePressed){
    play = true;
  }
}

void gameOver() {
    background(0);
  fill(255);
  text("Game Over!", width/2,height/2);
  noLoop();
}
