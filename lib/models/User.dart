class User {
  final String email;
  final String firstname;
  final String secondname;
  final String password;
  final String c_password;
  final String token;

  User({
    required this.email,
    required this.firstname,
    required this.secondname,
    required this.password,
    required this.c_password,
    required this.token,
  });



  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      email: json['email'],
      firstname: json['firstname'],
      secondname: json['secondname'],
      password: json['password'],
      c_password: json['c_password'],
      token: json['token'],
    );
  }
}