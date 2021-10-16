class User{
  String username;
  String password;
  
  public User(String username, String password){
    this.username = username;
    this.password = password;
  }
  
  boolean checkLogin(String username, String password){
   return this.username.equals(username) && this.password.equals(password);
  }
  
  String getUsername(){
    return this.username;
  }
}
