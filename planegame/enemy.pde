class enemy {
  float x, y; // position
  float speed = 4; //enemy speed
  float accelerate = 0.01;
  int life;

  enemy(float x, float y) {
    this.x=x;
    this.y=y;
    life=(int)random(1, 3);
  }

  void display() {
    imageMode(CENTER);
    tint(255-50*life);//alien gets transparent when thier life decrease
    image(Alien, x, y);
  }

  void update() {
    y +=speed;
    speed +=accelerate;
  }
  
  boolean die() {//enemy die
    if (y>height+50 || life<=0) {
      return true;
    }
    return false;
  }
   boolean reach() {//enemy win
    if (y>height+50 ) {
      return true;
    }
    return false;
  }
  void hit(){
  for(int i= 0; i<ammos.size();i++){
  Ammo ammo = (Ammo) ammos.get(i);
  if(dist(x, y, ammo.x, ammo.y)<25){
  life-=1;
  ammos.remove(i);
  if(life<=0){
  
  }
  }
  
  }
  
  }
}
