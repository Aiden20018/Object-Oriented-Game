Player player;
ArrayList<Asteroid> asteroids;
ArrayList<Stars> stars;
ArrayList<Bullet>bullets;

int gameState = 0;
int timer = 0;
int spawnTimer = 0;
float seconds = timer/60.0;

PImage shipImg;

void setup(){
  size(400, 400);
   shipImg = loadImage("Cartoon_space_rocket.png");
   
   stars = new ArrayList<Stars>();
   for (int i = 0; i <50; i++){
     stars.add(new Stars());
   }

   bullets = new ArrayList<Bullet>();
   
  resetGame();

}

void draw (){
  background(20);
  
  if (gameState==0) {
    fill(255);
    textAlign(CENTER);
    text("Avoid the Asteroids!\nPress any key to start", width/2, height/2);
  }
  else if (gameState==1) {
    runGame();
  }
  else if (gameState==2) {
    fill(0, 255, 0);
    textAlign(CENTER);
    text("YOU WIN!\nPress any key to restart", width/2, height/2);
  }
  else if (gameState==3) {
    fill(255,0,0);
    textAlign(CENTER);
    text("GAME OVER!\nPress any key to restart", width/2, height/2);
  }
}


void runGame() {
  timer++;
  int timeleft = 20 - int(timer/60);
  
   for (Stars s : stars) {
      s.update();
      s.display();
   }
   
  if (keyPressed) {
    if (key=='a') player.applyForce(new PVector(-0.5,0));
    if (key=='d') player.applyForce(new PVector (0.5,0));
    if (key=='w') player.applyForce(new PVector (0,-0.5));
    if (key=='s') player.applyForce(new PVector (0,0.5));
  }
  
  player.update();
  player.edges();
  player.display();
  
  spawnTimer++;
  if (spawnTimer>30) {
    asteroids.add(new Asteroid());
    spawnTimer = 0;
  }

  for (int i = bullets.size() -1; i >= 0; i--) {
    Bullet b = bullets.get(i);
    
    b.update();
    b.display();
    
    if (b.offScreen()){
      bullets.remove(i);
  }
}

  for (int i = asteroids.size() -1; i >= 0; i--) {
    Asteroid a = asteroids.get(i);
    
    a.update();
    a.display();

     for (int j = bullets.size() -1; j >= 0; j--){
      Bullet b = bullets.get(j);
      
      float d = dist(b.pos.x,b.pos.y, a.pos.x, a.pos.y);
      
      if (d < a.size/2) {
        asteroids.remove(i);
        bullets.remove(j);
        break;
      }
     }
    
    float d = dist(player.pos.x, player.pos.y, a.pos.x, a.pos.y);
    if (d < player.size/2 + a.size/2) {
      gameState = 3;
    }
    
    if (a.offScreen()){
      asteroids.remove(i);
    }
  }

if (timer > 1200){
    gameState = 2;
  }

  
  fill(255);
  textSize(16);
  textAlign(LEFT);
  text("Time Left: " + timeleft, 10, 20);
}

void resetGame(){
  player = new Player();
  asteroids = new ArrayList<Asteroid>();
  timer = 0;
  spawnTimer = 0;
  gameState = 0;
}

void keyPressed(){
  if (gameState==0) {
    gameState = 1;
  }
  else if (gameState==2 || gameState==3){
    resetGame();
  }
  
  if (gameState == 1 && key == ' '){
    bullets.add(new Bullet(player.pos));
  }
}
  
