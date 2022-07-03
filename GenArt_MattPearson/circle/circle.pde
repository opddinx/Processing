size(500, 300);
background(255);
strokeWeight(5);
smooth();

float radius = 100;
int centx = 250;
int centy = 150;

stroke(0, 30);
noFill();
ellipse(centx, centy, radius*2, radius*2);

// simple circle
/**
stroke(20, 50, 70);
float x, y;
for (float ang = 0; ang <= 360; ang += 5) {
  float rad = radians(ang);
  x = centx + (radius * cos(rad));
  y = centy + (radius * sin(rad));
  point(x, y);
}
**/

// helix
/**
radius = 10;
stroke(20, 50, 70);
float x, y;
float lastx = -999;
float lasty = -999;
for (float ang = 0; ang <= 1440; ang += 5) {
  radius += 0.5;
  float rad = radians(ang);
  x = centx + (radius * cos(rad));
  y = centy + (radius * sin(rad));
  if (lastx > -999) {
    line(lastx, lasty, x, y);
  }
  lastx = x;
  lasty = y;
}
**/

// add noise to helix
/**
radius = 10;
stroke(20, 50, 70);
float x, y;
float lastx = -999;
float lasty = -999;
float nSeed = random(10);
for (float ang = 0; ang <= 1440; ang += 5) {
  radius += 0.5;
  nSeed += 0.05;
  float trueRad = radius + (noise(nSeed) * 200) - 100;
  float rad = radians(ang);
  x = centx + (trueRad * cos(rad));
  y = centy + (trueRad * sin(rad));
  if (lastx > -999) {
    line(lastx, lasty, x, y);
  }
  lastx = x;
  lasty = y;
}
**/

// rep helix
/**
strokeWeight(0.5);
for (int i = 0; i < 100; i++) {
  float x, y;
  float lastx = -999;
  float lasty = -999;
  float nSeed = random(10);
  radius = 10;
  stroke(random(20), random(50), random(80), 80);
  int sAngle = int(random(360));
  int eAngle = 1440 + int(random(1440));
  int stepAngle = 3 + int(random(5));
  for (float ang = sAngle; ang <= eAngle; ang += stepAngle) {
    radius += 0.5;
    nSeed += 0.05;
    float trueRad = radius + (noise(nSeed) * 200) - 100;
    float rad = radians(ang);
    x = centx + (trueRad * cos(rad));
    y = centy + (trueRad * sin(rad));
    if (lastx > -999) {
      line(lastx, lasty, x, y);
    }
    lastx = x;
    lasty = y;
  }
}
**/
