class Card {
  float [] inputs;
  float [] outputs;
  int label;
  Card() {
    inputs = new float[196];
    outputs = new float[10];
  }
  void imageLoad() {
    //each image is 196 bytes
  }
  void labelLoad() {
  }
}

void loadData() {  
  println("Loading Training Data...");
  Table table = loadTable("mnist_train.csv");  
  println("Training Data Loaded");
  println("# of columns: " + table.getColumnCount());// Should be 28x28+1 OR 785
  
  for(int i=0; i<4;i++) {
    pushMatrix();
    
    switch (i) {
      case 0: translate(0, 0);
        break;
      case 1: translate(300, 0);
        break;
      case 2: translate(0, 300);
        break;
      case 3: translate(300, 300);
        break;
      default: break;
    }
    viewImage(table.getRow(i));
    
    popMatrix();
  }
}

void viewImage(TableRow image) {
  int size = 10;
  int column = 1;
  int row = 1;
  
  println("Label: " + image.getInt(0)); // The number the following pixels should look like
  
  for(int i = 1; i<image.getColumnCount(); i++) {
    
    if(row > 28) { // shouldn't happen. Table row is then too big.
      println("Image exceeded expected size...Breaking viewImage() Loop");
      break;
    }
    
    pushMatrix();
    translate(size * column, size * row);
    fill(convertGreyScale(image.getInt(i)));
    ellipse(0, 0, size, size);
    popMatrix();
    
    column++;
    if(column > 28){
      column = 1;
      row++;
    }
    
  } 
}

// invert the image colors so that the background is white.
int convertGreyScale(int toConvert) {
  if(toConvert < 85) return 255;
  else if (toConvert > 170) return 0;
  else return 127;
}
