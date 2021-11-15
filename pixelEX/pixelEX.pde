PImage pic;
int spacing=5;

void setup(){
 pic=loadImage("splatoon.jpg");
 size(800,500, P2D);
 pic.resize(width, height);
}

void draw(){
  for (int x=spacing; x<width; x+=spacing) {
    for (int y=spacing; y<height; y+=spacing) {
      color c=pic.get(x, y);
      fill(c);
      noStroke();
      ellipse(x, y, spacing*0.6, spacing*0.6);
    }
  }
   save("image_2.jpg");
}
