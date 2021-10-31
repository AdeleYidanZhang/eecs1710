class Letter {
  
  PShape s;
  PVector position;
  PVector[] vertices;
  float spread= 0.1 ;

  
  Letter(PShape _s, float x, float y) {
    s = _s;
    position = new PVector(x, y);
    vertices = new PVector[s.getVertexCount()];
  }
  
  void update() {
    for (int i=0; i<vertices.length; i++) {
      vertices[i] = s.getVertex(i);
      spread=spread+random(0.002);
      vertices[i].add(new PVector(random(-spread, spread), random(-spread)));
      s.setVertex(i, vertices[i]);
    }
  }
  
  void draw() {
    shapeMode(CENTER);;
    shape(s, position.x+10, position.y-100);
    shape(s, position.x+5, position.y-90);
    shape(s, position.x, position.y-80);
  }
  
  void run() {
    update();
    draw();
  }
  
}
