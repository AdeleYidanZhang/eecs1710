PImage sea;
PImage kk;
PImage s;
PImage f;
float x;
float y;
float r=0;
float speedX = 2;

void setup() {
  size(480, 216, P2D);
  sea = loadImage("sea.png");
  s = loadImage("splash.png");
  kk = loadImage("kk.png");
  f= loadImage("fish.png");
  x = width/2;
  y = height/2;
  imageMode(CENTER);
}

void draw() {
  background(sea);

  x += speedX;
  if (x > width || x < 0) {
    speedX *= -1;
    
  }
  /*
  // you can also do it this way:
  if (x > width) {
    speedX *= -1;
  } else if (x < 0) {
    speedX *= -1;
  }
  */

  image(sea, x, y, sea.width * (height / sea.height), height);
   tint(255,160);
   image(kk, mouseX, mouseY, width/4, height/4);
   translate(mouseX, mouseY);
   rotate(r);
   // image(s, 0, 0, width/4, height/4);
  image(f, 120, 150, width/6, height/6);
    
    
    r=r+0.04;
  
}
