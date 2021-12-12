import processing.sound.*;

Amplitude amp; //<>//
Button button1, button2;
SoundFile music1, music2;
BandPass bandPass;
float freq1=100;
float freq2= 1000;
PFont font;
int fontSize = 24;

int xspacing = 8;   
int w;              
int maxwaves = 4;   

float theta = 0.0;
float[] amplitude = new float[maxwaves];  
float[] dx = new float[maxwaves];          
float[] yvalues; 

void setup() {
                          

  size(800, 600, P2D);
  music1 = new SoundFile(this, "bokudan.mp3");
  music2 = new SoundFile(this, "notec.mp3");
  amp = new Amplitude(this);
  amp.input(music1);
  
  bandPass = new BandPass(this);
  button1 = new Button(width/4,height/2,100,color(#FFDD31),fontSize,"Kowa","ellipse");
  button2 = new Button(width/4 + 350,height/2,100,color(#FFDD31),fontSize,"note C","ellipse");
  font = createFont("times new roman",fontSize);
  
  bandPass.process(music1);
  bandPass.process(music2);
  
  bandPass.freq(freq1);
  
  

  
  frameRate(30);
  colorMode(RGB, 255, 255, 255, 100);
  w = width + 16;

  for (int i = 0; i < maxwaves; i++) {
    amplitude[i] = random(10,30);
    float period = random(100,300); // How many pixels before the wave repeats
    dx[i] = (TWO_PI / period) * xspacing;
  }

  yvalues = new float[w/xspacing];
}

void draw() {  // draw() loops forever, until stopped
  float a= amp.analyze();
  background(204);
 
  background(mouseX,mouseY, 127);
  
  fill(0);
  textAlign(CENTER);
  textFont(font,fontSize);
  text("",width/4,fontSize*1.5);
  text("",(width/4)+(width/2),fontSize*1.5);
  text(a,100,fontSize*1.5);
   
  button1.update();
  button2.update();
  calcWave();
 
  renderWave();
  
}




void calcWave() {
  // Increment theta (try different values for 'angular velocity' here
  theta += 0.02;

  // Set all height values to zero
  for (int i = 0; i < yvalues.length; i++) {
    yvalues[i] = 0;
  } //<>//
 
  // Accumulate wave height values
  for (int j = 0; j < maxwaves; j++) {
    float x = amp.analyze()*100;
    for (int i = 0; i < yvalues.length; i++) {
      
      if (j % 2 == 0)  yvalues[i] += sin(x)*amplitude[j];
      else yvalues[i] += cos(x)*amplitude[j];
      x+=dx[j];
    }
  }
}

void renderWave() {

  noStroke();
  fill(amp.analyze()*4000+100,amp.analyze()*2000+15,amp.analyze()*1000+140);
  ellipseMode(CENTER);
  for (int x = 0; x < yvalues.length; x++) {
    ellipse(x*xspacing,height*3/4+yvalues[x],16,16);
  }
}
