class Stars {
  PVector pos;
  float speed;
  float size;
  
  Stars() {
    pos = new PVector(random(width), random(height));
    speed = random(0.5,2);
    size = random(1,3);
  }
  
  void update(){
    pos.y += speed;
    
    if (pos.y > height){
      pos.y = 0;
      pos.x = random(width);
    }
  }
  
  void display() {
    noStroke();
    fill(255);
    ellipse(pos.x, pos.y, size, size);
  }
}
