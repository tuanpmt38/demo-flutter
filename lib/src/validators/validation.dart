
class Validations{
  static bool isValidUser(String user){
    return user != null;
  }

  static bool isValidPassword(String password){
    return password != null && password .length> 6;
  }
}
