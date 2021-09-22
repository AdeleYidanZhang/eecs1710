
PGraphics canvas;
int colorr=150;

void setup() {
  size(800,600,P2D);
  noSmooth();
  canvas = createGraphics(width,height,JAVA2D);
  canvas.beginDraw();
  canvas.smooth();
  canvas.endDraw();
}

void draw() {
  background(52, 209, 255);
  noStroke();
  image(canvas,0,0);
}

void mouseDragged() {
  if (mouseButton == LEFT) { drawFunction(); 
println("pen");}
  else { 
    println("eraser");
    noFill(); 
    stroke(201,125,252); 
    ellipse(mouseX,mouseY,50,50); eraseFunction(); }
}

void drawFunction() {
  canvas.beginDraw();
  canvas.noStroke();
  canvas.fill(190+random(colorr),190+random(colorr),190+random(colorr));
  canvas.ellipse(mouseX,mouseY,20,20);
  canvas.endDraw();
}

void eraseFunction() {
  color c = color(0,0);
  canvas.beginDraw();
  canvas.loadPixels();
  for (int x=0; x<canvas.width; x++) {
    for (int y=0; y<canvas.height; y++ ) {
      float distance = dist(x,y,mouseX,mouseY);
      if (distance <= 25) {
        int loc = x + y*canvas.width;
        canvas.pixels[loc] = c;
      }
    }
  }
  canvas.updatePixels();
  canvas.endDraw();
}
