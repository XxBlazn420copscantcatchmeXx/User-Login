class Screen{
  ArrayList<Widget> widgets;
  ArrayList<FloatingText> texts;
  Widget active;
  
  public Screen(){
    widgets = new ArrayList<Widget>();
    texts = new ArrayList<FloatingText>();
  }
  
  Widget addWidget(Widget w){
    widgets.add(w);
    return w;
  }
  
  void addText(FloatingText t){
    texts.add(t); 
  }
 
  void draw(){
    for(Widget w : widgets){
      w.draw(w == active);
    }
    for(FloatingText t : texts){
      t.draw();
    }
  }
  
  void mouseClicked(){
    for(Widget w : widgets){
      if(w.isHovered()){
        active = w;
        w.onClick();
        break;
      }
    }
  }
  
  void keyPressed(){
    if(active != null){
      active.keyPressed();
    }
  }
}
