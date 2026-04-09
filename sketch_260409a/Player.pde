class Player {
  PVector pos;
  PVector vel;
  PVector acc;
  float size = 20;
  PImage img;
  
  Player() {
    pos = new PVector(width/2, height/2);
    vel = new PVector(0,0);
    acc = new PVector(0,0);
    img = shipImg;
  }
  void update() {
    vel.add(acc);
    pos.add(vel);
    acc.mult(0);
    vel.mult(0.95);
  } 
  
  void edges() {
    pos.x = constrain(pos.x, 0, width);
    pos.y = constrain(pos.y, 0, height);
  }
  
  void display() {
    imageMode(CENTER);
    image(img, pos.x, pos.y, size, size);
  }
  void applyForce(PVector force) {
    acc.add(force);
  }   
}
