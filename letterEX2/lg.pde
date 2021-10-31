class LetterGenerator {
  
  PShape a, b, c;
  ArrayList<Letter> letters;
  PVector position;
  float offset = 140;
  
  LetterGenerator(String input, float x, float y) {
    initShapes();
    position = new PVector(x, y);
    letters = new ArrayList<Letter>();
    
    for (int i=0; i<input.length(); i++) {     
      char ch = input.charAt(i);
      
      float px = position.x + ((i+1) * offset);
      float py = position.y;
      
      switch(ch) {
        case 'a':
          letters.add(new Letter(a, px, py));
          break;
        case 'b':
          letters.add(new Letter(b, px, py));
          break;
        case 'c':
          letters.add(new Letter(c, px, py));
          break;
      }
    }
    
  }

  void initShapes() {
    a = createShape();
    a.beginShape();
    a.translate(170, 20);
    a.vertex(random(0, 4), random(0,4));
    a.vertex(-175.8, 353.3);
    a.vertex(-43.7, 220.4);
    a.vertex(57.4, 219.5);
    a.vertex(177.5, 358.4);
    a.vertex(177.5, 358.4);
    a.beginContour();
    a.vertex(-40,180);
    a.vertex(0, 60);
    a.vertex(40,180);
    a.endContour();
    a.endShape(CLOSE);
    
    b = createShape();
    b.beginShape();
    b.translate(50, 0);
    b.vertex(0.0, 0.0);
    b.vertex(-11.149227, 313.036);
    b.vertex(202.40138, 230.70326);
    b.vertex(59.17667, 145.7976);
    b.vertex(204.97429, 24.871357);
    b.beginContour();
    b.vertex(40,120);
    b.vertex(40, 30);
    b.vertex(120, 50);
    b.endContour();
    b.beginContour();
    b.vertex(30,260);
    b.vertex(30, 180);
    b.vertex(110, 230);
    b.endContour();
    b.endShape(CLOSE);   
    
    c = createShape();
    c.beginShape();
    c.translate(255, 0);
    c.vertex(0.0, 0.0);
    c.vertex(-177.53003, -7.718689);
    c.vertex(-168.9537, 282.16125);
    c.vertex(51.457947, 269.29675);
    c.vertex(-127.78732, 246.99829);
    c.vertex(-146.65524, 21.440826);
    c.endShape(CLOSE);
  }
 
  void update() {
    //
  }
  
  void draw() {
    for (Letter letter : letters) {
      letter.run();
    }
  }
  
  void run() {
    update();
    draw();
  }

}
