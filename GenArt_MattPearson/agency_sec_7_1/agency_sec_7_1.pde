Cell [][] _cellArray;
int _cellsize = 10;
int _numx, _numy;

void setup() {
  size(500, 300);
  _numx = floor(width/_cellsize);
  _numy = floor(height/_cellsize);
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
      
      
}
  
