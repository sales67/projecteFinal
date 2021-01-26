void pantallaJoc(){  
  background(0);
  gc.update();  
  if (this.right){
    this.gc.right();
  }else if (this.left){
    this.gc.left();
  }
}
