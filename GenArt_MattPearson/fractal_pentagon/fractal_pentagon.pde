FractalRoot pentagon;
int _maxLevels = 4;
float _strutFactor = 0.2;
float _strutNoise;
int _numSides = 8;

void setup() {
  size(1000, 1000);
  smooth();
  _strutNoise = random(10);
}

void draw() {
  background(255);
  _strutNoise += 0.01;
  _strutFactor = noise(_strutNoise) * 2;
  pentagon = new FractalRoot(frameCount);
  pentagon.drawShape();
}

class PointObj {
  float x, y;
  PointObj(float ex, float why) {
    x = ex;
    y = why;
  }
}

// one pentagon
class FractalRoot {
  PointObj[] pointArr = {};
  Branch rootBranch;
  
  FractalRoot(float startAngle) {
    float centX = width/2;
    float centY = height/2;
    float angleStep = 360.0f/_numSides;
    for (int i=0; i<360; i+=angleStep) {
      float x = centX + (400 * cos(radians(i + startAngle)));
      float y = centY + (400 * sin(radians(i + startAngle)));
      pointArr = (PointObj[])append(pointArr, new PointObj(x, y));
    }
    rootBranch = new Branch(0, 0, pointArr);
  }
  
  void drawShape() {
    rootBranch.drawMe();
  }
}
  
class Branch {
  int level, num;
  PointObj[] outerPoints = {};
  PointObj[] midPoints = {};
  PointObj[] projPoints = {};
  Branch[] myBranches = {};
  Branch(int lev, int n, PointObj[] points) {
    level = lev;
    num = n;
    outerPoints = points;
    midPoints = calcMidPoints();
    projPoints = calcStrutPoints();
    if (level+1 < _maxLevels) {
      // one more (main inner)
      Branch childBranch = new Branch(level + 1, 0, projPoints);
      myBranches = (Branch[])append(myBranches, childBranch);
      // more (crushed ones)
      for (int i=0; i<outerPoints.length; i++) {
         int nexti = i-1;
         if (nexti < 0) {nexti += outerPoints.length; }
         PointObj[] newPoints = {projPoints[i], midPoints[i], outerPoints[i], midPoints[nexti], projPoints[nexti]};
         childBranch = new Branch(level + 1, i + 1, newPoints);
         myBranches = (Branch[])append(myBranches, childBranch);
      }
    }
  }
  
  PointObj[] calcMidPoints() {
    PointObj[] mpArray = new PointObj[outerPoints.length];
    for (int i=0; i<outerPoints.length; i++) {
      int nexti = i+1;
      if (nexti == outerPoints.length) { nexti = 0; }
      PointObj thisMP = calcMidPoint(outerPoints[i], outerPoints[nexti]);
      mpArray[i] = thisMP;
    }
    return mpArray;
  }

  PointObj calcMidPoint(PointObj end1, PointObj end2) {
    return new PointObj((end1.x+end2.x)/2, (end1.y+end2.y)/2);
  }
  
  PointObj[] calcStrutPoints() {
    PointObj[] strutArray = new PointObj[midPoints.length];
    for (int i=0; i<midPoints.length; i++) {
      int nexti = i + 3;
      if (nexti >= midPoints.length) { nexti -= midPoints.length; }
      PointObj thisSP = calcProjPoint(midPoints[i], outerPoints[nexti]);
      strutArray[i] = thisSP;
    }
    return strutArray;
  }
  
  PointObj calcProjPoint(PointObj mp, PointObj op) {
    float adj, opp;
    opp = op.x - mp.x;
    adj = op.y - mp.y;
    return new PointObj(mp.x + opp * _strutFactor, mp.y + adj * _strutFactor);
  }
    
  void drawMe() {
    strokeWeight(_maxLevels - level);
    for (int i=0; i<outerPoints.length; i++) {
      int nexti = i+1;
      if (nexti == outerPoints.length) { nexti = 0;}
      line(outerPoints[i].x, outerPoints[i].y, outerPoints[nexti].x, outerPoints[nexti].y);
    }
    strokeWeight(0.5);
    fill(255, 150);
    for (int j=0; j<midPoints.length; j++) {
      //ellipse(midPoints[j].x, midPoints[j].y, 15, 15);
      if (level < _maxLevels - 1) { line(midPoints[j].x, midPoints[j].y, projPoints[j].x, projPoints[j].y); }
      //ellipse(projPoints[j].x, projPoints[j].y, 15, 15);
    }
    for (int i=0; i<myBranches.length; i++) {
      myBranches[i].drawMe();
    }
  }
}
