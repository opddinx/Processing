size(500, 100);
background(255);
strokeWeight(5);
smooth();

stroke(0, 30);
line(20, 50, 480, 50);

stroke(20, 50, 70);
// rand line1
/**
int step = 10;
float lastx = -999;
float lasty = -999;
float y = 50;
int bordx = 20;
int bordy = 10;
for (int x = bordx; x <= width - bordx; x += step) {
  y = bordy + random(height - 2 * bordy);
  if (lastx > -999) {
    line(lastx, lasty, x, y);
  }
  lastx = x;
  lasty = y;
}**/

//smooth lining
/**
float xstep = 10;
float ystep = 10;
float lastx = 20;
float lasty = 50;
float y = 50;
for (int x = 20; x <= 480; x+=xstep) {
  ystep = random(20) - 10;
  y += ystep;
  line(x, y, lastx, lasty);
  lastx = x;
  lasty = y;
}
**/

//perlin noise
/**
float xstep = 10;
float lastx = 20;
float lasty = 50;
float ynoise = random(10);
float y;
for (int x = 20; x <= 480; x+=xstep) {
  y = 10 + noise(ynoise) * 80;
  line(x, y, lastx, lasty);
  lastx = x;
  lasty = y;
  ynoise += 0.1;
}
**/

//sine curve
float xstep = 1;
float lastx = 20;
float lasty = 50;
float angle = 0;
float y;
for (int x = 20; x <= 480; x+=xstep) {
  //y = 50 + 40 * (sin(radians(angle)));
  //y = 50 + 40 * (pow(sin(radians(angle)), 3));
  y = 50 + 40 * noise(radians(angle * 2)) * (pow(sin(radians(angle)), 3));
  line(x, y, lastx, lasty);
  lastx = x;
  lasty = y;
  angle++;
}
