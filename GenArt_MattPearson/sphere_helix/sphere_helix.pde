import processing.opengl.*;

int radius = 100;

void setup() {
  size(500, 300, OPENGL);
  background(255);
  stroke(0);
}

void draw() {
  background(255);
  translate(width/2, height/2, 0);
  rotateY(frameCount * 0.03);
  rotateX(frameCount * 0.04);
  
  float s = 0;
  float t = 0;
  float lastx = 0;
  float lasty = 0;
  float lastz = 0;
  
  while(t < 180) {
    s += 18; 
    t += 1; // ↑0 ↓180 
    
    float radS = radians(s);
    float radT = radians(t);
    
    float thisx = radius * cos(radS) * sin(radT);
    float thisy = radius * sin(radS) * sin(radT);
    float thisz = radius * cos(radT);
    
    if (lastx != 0){
      line(thisx, thisy, thisz, lastx, lasty, lastz);
    }
    lastx = thisx;
    lasty = thisy;
    lastz = thisz;
  }
}
