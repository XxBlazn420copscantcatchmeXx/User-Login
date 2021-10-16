class FloatingTextCentered extends FloatingText{
  float halfTextWidth;
  
  public FloatingTextCentered(String text, int x, int y, int size, color c){
    super(text, x, y, size, c);
    textSize(size);
    halfTextWidth = textWidth(text)/2;
  }
  
  void setText(String text){
    super.setText(text);
    textSize(size);
    halfTextWidth = textWidth(text)/2;
  }
  
  void draw(){
    textSize(size);
    fill(c);
    text(text, x-halfTextWidth, y); 
  }
}
