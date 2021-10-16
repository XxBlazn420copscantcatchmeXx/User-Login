class Widget {
  int x;
  int y;
  int w;
  int h;
  
  public Widget(int x, int y, int w, int h){
   this.x = x;
   this.y = y;
   this.w = w;
   this.h = h;
  }
  
  boolean isHovered(){
    return mouseX > x && mouseX <= x+w && mouseY > y && mouseY <= y+h;
  }
  
  void draw(boolean isActive){
    
  }
  
  void onClick(){
    
  }
  
  void keyPressed(){
    
  }
}
