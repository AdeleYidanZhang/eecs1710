LetterGenerator lg;
String input = "ccbaa";

void setup() {
  size(800, 600, P2D);
  lg = new LetterGenerator(input, 0, height);//lg's position
}

void draw() {
  background(127+mouseY, 127+mouseX,127+random(100));
  
  lg.run(); 
}
