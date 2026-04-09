class Bullet {
  PVector pos;
  PVector vel;
  float size = 5;
  
  Bullet(PVector startPos){
    pos = startPos.copy();
    vel = new PVector(0,-5);
  }
  
  void update() {
    pos.add(vel);
  }
  
  void display() {
    fill(255,255,0);
    ellipse(pos.x,pos.y,size,size);
  }
  
  boolean offScreen(){
    return pos.y < 0;
  }
}
