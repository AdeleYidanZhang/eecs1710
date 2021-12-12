import oscP5.*;
import netP5.*;

String ipNumber = "127.0.0.1";
int receivePort = 7110;
int sendPort = 7110;
OscP5 oscP5;
NetAddress myRemoteLocation;

String channel = "test";

Button button;
float a;
PFont font;
int fontSize = 24;
color receiveOff = color(#FF7ED0);
color receiveOn = color(255,50,0);
color receiveNow = receiveOff;
float sizeOff = 100;
float sizeOn = 110;
float sizeNow = sizeOff;

float oscSendData = 0;
float oscReceiveData = 0;

void setup() {
  size(640, 480, P2D);
  
  oscSetup();
  
  button = new Button(width/4,height/2,100,color(#FFDD31),fontSize,"","ellipse");
  font = createFont("times new roman",fontSize);

}

void draw(){
  background(mouseX,mouseY, random(127));
  
  fill(0);
  textAlign(CENTER);
  textFont(font,fontSize);
  text("",width/4,fontSize*1.5);
  text("",(width/4)+(width/2),fontSize*1.5);
   
  button.update();
  
  if (oscReceiveData > 0.5) {
    sizeNow = sizeOn;
    receiveNow = receiveOn;
  } else {
    sizeNow = sizeOff;
    receiveNow = receiveOff;  
  }

  fill(receiveNow);
  rect((width/4)+(width/2),height/2,sizeNow,sizeNow);
}
