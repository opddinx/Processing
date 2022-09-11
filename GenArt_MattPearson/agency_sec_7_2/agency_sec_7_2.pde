Cell [][] _cellArray;
int _cellSize = 10;
int _numx, _numy;

void setup() {
  size(500, 300);
  _numx = floor(width/_cellSize);
  _numy = floor(height/_cellSize);
  restart();
}

void restart() {
  _cellArray = new Cell[_numx][_numy];
  for (int x=0; x<_numx; x++) {
    for (int y=0; y<_numy; y++) {
      Cell newCell = new Cell(x, y);
      _cellArray[x][y] = newCell;
    }
  }
  
  for (int x=0; x<_numx; x++) {
    for (int y=0; y<_numy; y++) {
      int above = y-1;
      int below = y+1;
      int left = x-1;
      int right = x+1;
      
      if (above < 0) {above = _numy - 1;}
      if (below == _numy) {below = 0;}
      if (left < 0) {left = _numx -1;}
      if (right == _numx) {right = 0;}
      
      _cellArray[x][y].addNeighbor(_cellArray[left][above]);
      _cellArray[x][y].addNeighbor(_cellArray[left][y]);
      _cellArray[x][y].addNeighbor(_cellArray[left][below]);
      _cellArray[x][y].addNeighbor(_cellArray[x][below]);
      _cellArray[x][y].addNeighbor(_cellArray[right][below]);
      _cellArray[x][y].addNeighbor(_cellArray[right][y]);
      _cellArray[x][y].addNeighbor(_cellArray[right][below]);
      _cellArray[x][y].addNeighbor(_cellArray[x][above]);
    }
  }
}

void draw() {
  background(200);
  for (int x=0; x<_numx; x++) {
    for (int y=0; y<_numy; y++) {
      _cellArray[x][y].calcNextState();
    }
  }
  translate(_cellSize/2, _cellSize/2);
  
  for (int x=0; x<_numx; x++) {
    for (int y=0; y<_numy; y++) {
      _cellArray[x][y].drawMe();
    }
  }
}

void mousePressed() {
  restart();
}

class Cell {
  float x, y;
  int state;
  int nextState;
  Cell[] neighbors;
  
  Cell(float ex, float why) {
    x = ex * _cellSize;
    y = why * _cellSize;
    nextState = int(random(2));
    state = nextState;
    neighbors = new Cell[0];
  }
  
  void addNeighbor(Cell cell) {
    neighbors = (Cell[])append(neighbors, cell);
  }

  void calcNextState() {
    int firingCount = 0;
    if (state == 0) {
      for (int i=0; i<neighbors.length; i++) {
        if (neighbors[i].state == 1) {
          firingCount++;
        }
      }
      if (firingCount == 2) {
        nextState = 1;
      } else {
        nextState = state;
      }
    } else if (state == 1) {
      nextState = 2;
    } else if (state == 2) {
      nextState = 0;
    }
  }

  void drawMe() {
    state = nextState;
    stroke(0);
    if (state == 1) {
      fill(0);
    } else if (state == 2) {
      fill(150);
    } else {
      fill(255);
    }
    ellipse(x, y, _cellSize, _cellSize);
  }
}
