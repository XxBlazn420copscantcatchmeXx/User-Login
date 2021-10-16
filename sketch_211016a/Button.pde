class Button extends Widget {
  String text;
  float halfTextWidth;
  ButtonAction action;
  
  color backgroundColor = color(98, 0, 238);
  color hoveredColor = color(110, 20, 239);
  color textColor = color(255);
  
  public Button(String text, int x, int y, int w, int h, ButtonAction action){
    super(x, y, w, h);
    this.text = text;
    this.action = action;
    textSize(16);
    halfTextWidth = textWidth(text)*0.5; 
  }
  
  void draw(boolean isActive){
    if(isHovered()){
      fill(hoveredColor);
    }
    else{
     fill(backgroundColor);
    }
    
    rect(x, y, w, h);
    
    textSize(16);
    fill(textColor);
    text(text, x+w*0.5-halfTextWidth, y+h*0.5+5); 
  }
  
  void onClick(){
    action.onClicked(this);
  }
}
