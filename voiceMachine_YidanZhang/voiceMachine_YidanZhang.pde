import ddf.minim.*;

Minim minim;
AudioInput in;

void setup(){
size(800, 600, P2D);
background(0);
stroke(255);

minim = new Minim(this);
in = minim.getLineIn();
}

void draw(){
float a = 0;
float angle = (2*PI)/100;
int step = in.bufferSize()/100;
for (int i =0; i<in.bufferSize()-step; i+=step){
float x1 = width/2 + cos(a) * (1000 * in.mix.get(i) + 100);
float y1 = height/2 + sin(a) * (1000 * in.mix.get(i) + 100);
float x2 = width/2 + cos(a + angle) *(1000 * in.mix.get(i+step) + 100);
float y2 = height/2 + sin(a + angle) *(1000 * in.mix.get(i+step) + 100);
stroke(random(255), random(10),mouseX+random(50));
line(x1, y1, x2, y2);
a+= angle;

}

}
