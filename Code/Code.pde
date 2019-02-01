

void setup() {
  size(800,800);
  background(255);
  frameRate(60);
  loadData();
}

void draw() {
}

void loadingAnimation() {
  int size = 100;
  int xpos = 0;
  int ypos = 25;
  
  pushMatrix();
  
  noFill();
  translate(400, 400);
  rotate(PI * frameCount / 60);
  ellipse(xpos, -ypos, size, size);
  ellipse(-xpos, ypos, size, size);
  
  popMatrix();
}
