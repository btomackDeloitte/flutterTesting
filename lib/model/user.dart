class User {
  String userName = '';
  String email = '';
  String password = '';

  void save() {
    print ('Saving User: $userName, $email, $password');
  }
}