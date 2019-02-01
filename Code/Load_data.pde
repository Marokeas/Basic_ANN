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
  viewImage(table.getRow(1));
}

void viewImage(TableRow image) {
  int size = 10;
  int column = 1;
  int row = 1;
  
  println("# of columns: " + image.getColumnCount());// Should be 28x28+1 OR 785
  println("Label: " + image.getInt(0)); // The number the following pixels should look like
  
  for(int i = 1; i<image.getColumnCount(); i++) {
    
    if(row > 28) { // shouldn't happen. Table row is then too big.
      println("Image exceeded expected size...Breaking viewImage() Loop");
      break;
    }
    
    pushMatrix();
    translate(size * column, size * row);
    fill(image.getInt(i));
    ellipse(0, 0, size, size);
    popMatrix();
    
    column++;
    if(column > 28){
      column = 1;
      row++;
    }
    
  }
  
}
