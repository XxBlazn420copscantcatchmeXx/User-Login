class FloatingText{
  String text;
  int x;
  int y;
  int size;
  color c;
 
  public FloatingText(String text, int x, int y, int size, color c){
    this.text = text;
    this.x = x;
    this.y = y;
    this.size = size;
    this.c = c;
  }
  
  void setText(String text){
   this.text = text;
  }
   
  void draw(){
    textSize(size);
    fill(c);
    text(text, x, y); 
  }
}
