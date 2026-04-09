class Asteroid {
  PVector pos;
  PVector vel;
  PVector acc;
  float size;
  
  Asteroid(){
    size = random(15,40);
    int edge = int(random(4));
    
    if (edge==0) pos = new PVector(random(width), 0);
    if (edge==1) pos = new PVector (random(width), height);
    if (edge==2) pos = new PVector (0, random(height));
    if (edge==3) pos = new PVector (width, random(height));
    
    PVector target = new PVector(width/2, height/2);
    vel = PVector.sub(target, pos);
    vel.normalize();
    vel.mult(random(1,3));
    
    acc = new PVector(0,0);
  }
  
  void update(){
    vel.add(acc);
    pos.add(vel);
  }
  
  void display(){
    fill(150);
    ellipse(pos.x,pos.y,size,size);
  }
  
  boolean offScreen(){
    return (pos.x < -50|| pos.x > width + 50 || pos.y < -50 || pos.y > height + 50);
  }
}
