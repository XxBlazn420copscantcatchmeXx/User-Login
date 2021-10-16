import java.util.Arrays;

class PasswordField extends TextField{
  public PasswordField(String placeholder, int x, int y, int w, int h){
    super(placeholder, x, y, w, h);
  }
  
  void draw(boolean isActive){
    if(isActive){
      fill(activeColor);
    }
    else if(isHovered()){
      fill(hoveredColor);
    }
    else{
     fill(backgroundColor);
    }
    
    rect(x, y, w, h);
    
    textSize(16);
    float textY = y+h*0.5+5;
    char[] chars = new char[text.length()];
    Arrays.fill(chars, '•');
    String dots = new String(chars);

    if(isActive){
      fill(activeTextColor);
      stroke(activeTextColor);
      
      if(cursorTimer < 10){
        float lineX = x + 5 + textWidth(dots.substring(0, cursorPosition));
        line(lineX, textY - 15, lineX, textY + 3);
      }
    }
    else{
      fill(inactiveTextColor);
      stroke(inactiveTextColor);
    }
    
    if(text.length() == 0){
      text(placeholder, x + 5, textY);
    }
    else{
      
      text(dots, x + 5, textY); 
    }
    
    cursorTimer = (cursorTimer+1)%20;
  }
}
