class Ammo{
  float x, y, speed = 10;
  Ammo(float x, float y){
  this.x=x;
  this.y=y;
  }
  void display(){
  fill(#ABFF4D);
  noStroke();
  rect(x, y, 5, 10);
  y -= speed; //move
  }
  boolean check(){
  if(y<-10){
    return true;
  }else{
    return false;
  }
}


}
