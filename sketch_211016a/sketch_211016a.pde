HashMap<String, User> users;

FloatingTextCentered notification;

Screen login;
TextField loginUsername;
TextField loginPassword;

Screen register;
TextField registerUsername;
TextField registerPassword1;
TextField registerPassword2;

Screen active;
User activeUser;

void addUser(User user){
  users.put(user.getUsername(), user);
}

void setup(){
  background(255);
  size(1600, 900);
  frameRate(30);
  
  users = new HashMap<String, User>();
  addUser(new User("Alex", "123"));
    
  int middle = width/2;
  
  notification = new FloatingTextCentered("", middle, 230, 16, color(60));
  
  //LOGIN SCREEN
  login = new Screen();
  login.addText(new FloatingTextCentered("Login Screen", middle, 200, 30, color(0)));
  loginUsername = new TextField("Username", middle-150, 250, 300, 30);
  login.addWidget(loginUsername);
  loginPassword = new PasswordField("Password", middle-150, 300, 300, 30);
  login.addWidget(loginPassword);
  login.addWidget(new Button("Register", middle - 150, 400, 140, 30, new ButtonAction(){
    public void onClicked(Button button){
      active = register;
    }
  }));
  login.addWidget(new Button("Login", middle + 10, 400, 140, 30, new ButtonAction(){
    public void onClicked(Button button){
      User user = users.get(loginUsername.getText());
      if(user != null && user.checkLogin(loginUsername.getText(),loginPassword.getText())){
        activeUser = user;
        Screen main = new Screen();
        main.addText(new FloatingTextCentered("Main Screen", width/2, 200, 30, color(0)));  
        main.addText(new FloatingTextCentered("Welcome " + activeUser.getUsername() + '!', width/2, 300, 70, color(0)));  

        main.addWidget(new Button("Log out", width/2 - 100, 400, 200, 30, new ButtonAction(){
          public void onClicked(Button button){
            activeUser = null;
            active = login;
          }
        }));

        active = main;
      }
      else {
        notification.setText("The username or password could not be found");
      }
    }
  }));
  login.addText(notification);
    
  //REGISTER SCREEN
  register = new Screen();
  register.addText(new FloatingTextCentered("Register Screen", middle, 200, 30, color(0)));
  registerUsername = new TextField("Username", middle-150, 250, 300, 30);
  register.addWidget(registerUsername);
  registerPassword1 = new PasswordField("Password", middle-150, 300, 300, 30);
  register.addWidget(registerPassword1);
  registerPassword2 = new PasswordField("Repeat password", middle-150, 350, 300, 30);
  register.addWidget(registerPassword2);
  register.addWidget(new Button("Back to login", middle - 150, 400, 140, 30, new ButtonAction(){
    public void onClicked(Button button){
      active = login;
    }
  }));
  register.addWidget(new Button("Register user", middle + 10, 400, 140, 30, new ButtonAction(){
    public void onClicked(Button button){
      if(users.containsKey(registerUsername.getText())){
        notification.setText("That username is already in use");
      }
      else if(!registerPassword1.getText().equals(registerPassword2.getText())){
        notification.setText("The passwords did not match");
      }
      else if(registerUsername.getText().length() < 2){
        notification.setText("The username must have a length of at least 2");
      }
      else if(registerPassword1.getText().length() < 3){
        notification.setText("The password must have a length of at least 3");
      }
      else{
        notification.setText("The user was successfully created");
        users.put(registerUsername.getText(), new User(registerUsername.getText(), registerPassword1.getText()));
        active = login;
      }
    }
  }));
  register.addText(notification);
  
  active = login;
}

void draw(){
  background(255);
  active.draw();
}

void mouseClicked(){
  notification.setText("");
  active.mouseClicked();
}

void keyPressed(){
  active.keyPressed();
}
