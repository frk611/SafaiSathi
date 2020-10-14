class User {
  String displayName;
  String email;
  String password;
  String ecoCoins;
  String role;

  User();

  User.fromMap(Map<String, dynamic> data) {
    displayName = data['displayName'];
    email = data['email'];
    password = data['password'];
    ecoCoins = data['ecoCoins'];
    role = data['role'];
  }

  Map<String, dynamic> toMap() {
    return {
      'displayName': displayName,
      'email': email,
      'password': password,
      'ecoCoins': ecoCoins,
      'role': role,
    };
  }
}
