/*

Zoe Caudron
Green arcs
4 arcs are drawn, each based in one position of the canvas. Hover your mouse over one 
area to change the diameter and thickness of the arc; click while hovering to change 
the color. The colours are each set so that the resulting colour is a hue of green.

*/

//----------------------------------------- GLOBAL VARIABLES -----------------------------------------

float x, y, w, h, rXa, rYa, rXb, rYb, rXc, rYc, rXd, rYd;  // defines size and position
float rA, rB, rC, rD;    // rotation applied to arcs A, B, C and D
float r, g, b, a;        // arc A colors
float rT, gB, bB, aB;    // arc B colors
float rTh, gC, bC, aC;   // arc C colors
float rF, gD, bD, aD;    // arc D colors
float step;              // increment used for diameter and strokeWeight
float p=0.0;             // smaller increment than frameCount, looks nicer and slower
float wA, wB, wC, wD;    // strokeWeights of arcs
boolean i=false;         // booleans to assess if we are over the area when we click
boolean j=false;
boolean k=false;
boolean l=false;

//----------------------------------------------- SETUP ----------------------------------------------

void setup() {

  size(1000, 1000);
  background(0);
  frameRate(30);      // animation speed
  smooth();           // anti-aliasing
  wA=random(3, 5);    // initial arc strokeWeight assigned at random 
  wB=random(3, 5);
  wC=random(3, 6);
  wD=random(4, 7);
  x=width/2;          // x and y correspond to the middle of the sketch
  y=height/2;
  w=300;              // arbitrary width and height of the grid defining the interaction area
  h=300;
  rXa=w;              // arbitrary initial diameters of the arcs
  rXb=w*2;
  rXc=w/2;
  rXd=w*1.5;
  rYa=h;
  rYb=h*2;
  rYc=h/2;
  rYd=h*1.5;
  r=255;              // intial arc colours are all white
  g=255;
  b=255;
  a=255;
  rT=255;
  gB=255;
  bB=255;
  aB=255;
  rTh=255;
  gC=255;
  bC=255;
  aC=255;
  rF=255;
  gD=255;
  bD=255;
  aD=255;
}

//------------------------------------------------ DRAW -----------------------------------------------

void draw() {


  noStroke();
  fill(0, 10);
  rect(0, 0, width, height);   // creates the trailing effect
  step=(sin(p));  // oscillates -1 to 1
  rA=0;           // intial arc rotations set to 0
  rB=0;
  rC=0;
  rD=0;
  noFill();
  //line(x, y-(h), x, y+(h));  lines to see where in the canvas we are
  //line(x-(w), y, x+(w), y);


// checking mouse position compared to the line grid: which of the 4 areas are we on?

  if (mouseX>=x-(w)&&mouseX<=x&&mouseY>=y-(h)&&mouseY<=y) {
    i=true;    // bool to change color in mousePressed()
    rA=mouseX;  // rotate by mouseX
    rXa+=step;   // rXa+= -1 to 1 so it pulses slowly
    rYa+=step;
    wA=abs(wA+(step/2));  // absolute because strokeWeight can't be negative
  } else {
    i=false;
  }
  
  // repeat same concept with the 3 remaining arcs 
  
  if (mouseX>=x&&mouseX<=x+(w)&&mouseY>=y-(h)&&mouseY<=y) {
    j=true;
    rB=mouseX;
    rXb+=step;
    rYb+=step;
    wB=abs(wB+(step/2));
  } else {
    j=false;
  }
  if (mouseX>=x-w&&mouseX<=x&&mouseY>=y&&mouseY<=y+h) {
    k=true;
    rC=mouseX;
    rXc+=step;
    rYc+=step;
    wC=abs(wC+(step/2));
  } else {
    k=false;
  }
  if (mouseX>=x&&mouseX<=x+w&&mouseY>=y&&mouseY<=y+h) {
    l=true;
    rD=mouseX;
    rXd+=step;
    rYd+=step;
    wD=abs(wD+(step/2));
  } else {
    l=false;
  }

  translate(x, y);      // now the origin is at the center of the sketch
  rotate(p/4);          // always rotates slowly for a nice dynamic effect
  push();               // so that style and transformations are only applied to one arc at a time
  stroke(r, g, b, a);   // stroke color
  strokeWeight(wA);     // stroke thickness defined in setup
  rotate(degrees(rA));  // set at 0 when we're not on the area
  arc(0, 0, rXa, rYa, 0, HALF_PI);    // draws an arc over a fourth of a circle 
  pop();                // that's it for this arc
  push();               // now onto the other 3 arcs
  stroke(rT, gB, bB, aB);
  strokeWeight(wB);
  rotate(degrees(rB));
  arc(0, 0, rXb, rYb, HALF_PI, PI);
  pop();
  push();
  stroke(rTh, gC, bC, aC);
  strokeWeight(wC);
  rotate(degrees(rC));
  arc(0, 0, rXc, rYc, PI, PI+HALF_PI);
  pop();
  push();
  stroke(rF, gD, bD, aD);
  strokeWeight(wD);
  rotate(degrees(rD));
  arc(0, 0, rXd, rYd, PI+HALF_PI, TWO_PI);
  pop();

  p+=0.1;               // increments at a slower pace than frameCount
}


//----------------------------------------------- EVENTS ----------------------------------------------

void mousePressed() {

  if (i==true&&mouseButton==LEFT) {      // if we click the left mouse button while the cursor is over area A
    r=random(200, 230);
    g=random(220, 255);
    b=random(200,240);
    a=random(25, 30);
  }
  if (j==true&&mouseButton==LEFT) {      // same concept

    rT=random(100,130);
    gB=random(190,220);
    bB=random(120, 170);
    aB=random(25, 30);
  }
  if (k==true&&mouseButton==LEFT) {

    rTh=random(70, 90);
    gC=random(170, 200);
    bC=random(120, 140);
    aC=random(25, 30);
  }
  if (l==true&&mouseButton==LEFT) {

    rF=random(20, 35);
    gD=random(50, 80);
    bD=random(30, 60);
    aD=random(25, 30);
  }
}

void keyPressed(){    // press any key to save an image

 save("sketch"+frameCount+".png");


}
