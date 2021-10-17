int s,m,h,d,mo,y;
PFont myFont;

void setup()
{
size(500,500);
background(255);
}

void draw() {
background(#151DA0);
s = second(); // Values from 0 - 59
m = minute(); // Values from 0 - 59
h = hour(); // Values from 0 - 23
d = day(); // Values from 1 - 31
mo = month(); // Values from 1 - 12
y = year(); // 2020,2021...

stroke(255);
myFont=createFont("impact",40);
print("h="+h+"\tm="+m+"\ts="+s+"\n"); 
myclockdraw();
}

void myclockdraw()
{
translate(width/2,height/2);
fill(400,16,68,50);
ellipse(0,0,400,400);
stroke(0);
textFont(myFont); 
fill(255); 
text("12",-10,-160); 
text("3",170,0);
text("6",-10,190);
text("9",-190,0);
text(y+"-" +mo +"-" +d, -80, 120);

pushMatrix();
rotate(PI*2*s/60+PI);
stroke(255,255,255,100);
strokeWeight(2);
line(0,0,0,160);
popMatrix(); //second

pushMatrix();
rotate(PI*2*m/60+PI);
stroke(#834BFF);
strokeWeight(3);
line(0,0,0,120); //minute
popMatrix();

pushMatrix();
rotate(PI*2*h/12+PI);
stroke(255,0,0);
strokeWeight(4);
line(0,0,0,80); //hour
popMatrix();
}
