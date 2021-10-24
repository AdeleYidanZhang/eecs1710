class Plane {
  float x, y;
  Plane(float x, float y) {
    this.x=x;
    this.y=y;
  }
  void display() {
    tint(255, 255);
    imageMode(CENTER);
    image(Plane, mouseX, mouseY);
  }
}
