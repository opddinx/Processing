int diam = 10;
float cX, cY;

void setup() {
  size(500, 300);
  frameRate(24);
  smooth();
  background(180);
  cX = width/2;
  cY = height/2;
  stroke(0);
  strokeWeight(1);
  // noFill();
  // pseudo fade
  fill(255,20);
}

void draw() {
  if (diam <= 400) {
    //background(180);
    ellipse(cX, cY, diam, diam);
    diam += 10;
  }
}
