PImage Plane;
PImage Alien;
float step = 5;
int ulife = 10;
int score =0;
Plane plane;

enemy [] enemys = new enemy[5];
ArrayList<Ammo> ammos = new ArrayList<Ammo>();//add or minus object in anytime

void setup() {
  size(400, 800, P2D);
  Plane = loadImage("plane.png");
  Alien = loadImage("alien.png");
  Plane.resize(100, 100);
  Alien.resize(50, 60);
  plane = new Plane(200, 200);

  for (int i=0; i<enemys.length; i++) {
    enemys[i] = new enemy(random(10, width-10), -50);
  }
}

void draw() {
  background(#8D5FF2);
  //score
  textAlign(LEFT);
  textSize(20);
  fill(#ABFF4D);
  text("Score:"+ score, 0.12*width, 0.05*height);
  text("Life:"+ ulife, 0.12*width, 0.1*height);
//plane
  plane.display();
  //enemy
  for (int i =0; i<enemys.length; i++) {
    enemys[i].display();
    enemys[i].update();
    enemys[i].hit();
    if(enemys[i].reach()){//enemy alive
    ulife-=1;
    enemys[i] = new enemy((int) random(10, width-10), -50);
    }
    if(enemys[i].die()){//enemy die
    score ++;
    enemys[i] = new enemy((int) random(10, width-10), -50);
    }
  }
  //bullet
  for(int i=0; i <ammos.size(); i++){
 Ammo ammo1 = (Ammo)ammos.get(i);
  //
 ammo1.display();
 if(ammo1.check()){
   ammos.remove(i);
 }
  }
}
//----------------------------------------------------

//----------------------------------------------------

//------------------------------------------------
