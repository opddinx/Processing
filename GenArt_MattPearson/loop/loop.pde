int diam = 10;
float cX, cY;

void setup() {
  size(500, 300);
  frameRate(24);
  smooth();
  background(120);
  cX = width/2;
  cY = height/2;
  stroke(0);
  strokeWeight(5);
  fill(255, 50);
}

void draw() {
  if (diam <= 400) {
    background(180);
    
    strokeWeight(5);
    fill(255, 50);
    ellipse(cX, cY, diam, diam);
    
    strokeWeight(0);
    noFill();
    int tempdiam = diam;
    while(tempdiam > 10) {
      ellipse(cX, cY, tempdiam, tempdiam);
      tempdiam -=10;
    }
    diam += 10;
  }
}
