boolean debug = true;
PVector position, target;
PImage faceCurrent, face01, face02, face03, face04,carrot,bg;
float margin = 50;

boolean isCaressed = false;
int botheredMarkTime = 0;
int botheredTimeout = 3000; // Processing measures time in milliseconds
float botheredSpread = 5;

boolean isBlinking = false;
int blinkMarkTime = 0;
int blinkTimeout = 4000;//blink per 4 secs
int blinkDuration =100;//blink speed

float triggerDistance1 = 100; //the distance would be bothered
float triggerDistance2 = 5;// inner circle
float movementSpeed = 0.03;

void setup() { 
  size(700, 800, P2D);
  
  position = new PVector(width/2, height/2);
  pickTarget();
  
  face01 = loadImage("happy.PNG");
  face01.resize(face01.width/1, face01.height/1);
  face02 = loadImage("neutral.PNG");
  face02.resize(face01.width, face01.height);
  face03 = loadImage("sad.PNG");
  face03.resize(face01.width, face01.height);
  face04 = loadImage("blink.PNG");
  face04.resize(face01.width, face01.height);
  carrot = loadImage("carrot.PNG");
  bg =loadImage("bg.jpg");
  
  faceCurrent = face01;
  
  ellipseMode(CENTER);
  rectMode(CENTER);
  imageMode(CENTER);
}

void draw() {
  background(bg);
  
  PVector mousePos = new PVector(mouseX, mouseY);
  isCaressed = position.dist(mousePos) > triggerDistance1;

  
  if (isCaressed) {
    botheredMarkTime = millis();
    faceCurrent = face02; //happy expression
    position = position.lerp(target, movementSpeed).add(new PVector(random(-botheredSpread, botheredSpread), random(-botheredSpread, botheredSpread)));
    if (position.dist(target) < triggerDistance2) {
      pickTarget();
    }
  } else if (!isCaressed && millis() > botheredMarkTime + botheredTimeout) {
    if (!isBlinking && millis() > blinkMarkTime + blinkTimeout) {
      isBlinking = true;
      blinkMarkTime = millis();
    } else if (isBlinking && millis() > blinkMarkTime + blinkDuration) {
      isBlinking = false;
    }

    if (isBlinking) {
      faceCurrent = face04; // blink with happy expression
    } else {
      faceCurrent = face03; // happy expression
    }    
  } else if (!isCaressed && millis() > botheredMarkTime + botheredTimeout/6) {
    faceCurrent = face01; // neutral expression
  }
    if (mousePressed == true) {
    image(carrot, mouseX, mouseY);
    faceCurrent=face01; 
  }

  position.y += sin(millis()) / 2;

  image(faceCurrent, position.x, position.y);

  if (debug) {
    noFill();
    stroke(#FFB9F6);
    //ellipse(position.x, position.y, triggerDistance1*2, triggerDistance1*2);
    ellipse(position.x, position.y, triggerDistance2*2, triggerDistance2*2);
    //line(target.x, target.y, position.x, position.y);
    stroke(#FFB9F6);
    rect(target.x, target.y, 10, 10);
  }
}

void pickTarget() {
  if(mousePressed==true){
  target = new PVector(mouseX,mouseY);
}else{
   target = new PVector(random(margin, width-margin), random(margin, height-margin));
}
}
