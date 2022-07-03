/**
size(300, 300);
smooth();
background(255);
float xstart = random(10);
float xnoise = xstart;
float ynoise = random(10);

for (int y = 0; y <= height; y+=1) {
  ynoise += 0.01;
  xnoise = xstart;
  for (int x = 0; x <= width; x+=1) {
    xnoise += 0.01;
    int alph = int(noise(xnoise, ynoise) * 255);
    stroke(0, alph);
    line(x, y, x+1, y+1);
  }
}
**/

float xstart, xnoise, ynoise;
void setup() {
  size(300, 300);
  smooth();
  //background(255);
  background(0);
  xstart = random(10);
  xnoise = xstart;
  ynoise = random(10);
  for (int y = 0; y <= height; y+=5) {
    ynoise += 0.1;
    xnoise = xstart;
    for (int x = 0; x <= width; x+=5) {
      xnoise += 0.1;
      drawPoint(x, y, noise(xnoise, ynoise));
    }
  }
}

/**
void drawPoint(float x, float y, float noiseF) {
  //float len = 10 * noiseF;
  //rect(x, y, len, len);
  pushMatrix();
  translate(x, y);
  rotate(noiseF * radians(360));
  stroke(0, 150);
  line(0, 0, 20, 0);
  popMatrix();
}
**/
void drawPoint(float x, float y, float noiseF) {
  pushMatrix();
  translate(x, y);
  rotate(noiseF * radians(540));
  float edgeSize = noiseF * 35;
  float grey = 150 + noiseF * 120;
  float alph = 150 + noiseF * 120;
  noStroke();
  fill(grey, alph);
  ellipse(0, 0, edgeSize, edgeSize/2);
  popMatrix();
}
