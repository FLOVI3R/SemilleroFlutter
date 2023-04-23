import 'dart:convert';

List<User> userFromJson(String str) => List<User>.from(jsonDecode(str).map((x) => User.fromJson(x)));

class User {
  final String? id;
  final String? email;
  final String? firstname;
  final String? secondname;
  final String? company_id;
  final String? type;
  final String? email_confirmed;
  final String? deleted;
  final String? actived;
  final String? iscontact;
  final String? company;
  final String? created_at;

  User({
    required this.id,
    required this.email,
    required this.firstname,
    required this.secondname,
    required this.company_id,
    required this.type,
    required this.email_confirmed,
    required this.deleted,
    required this.actived,
    required this.iscontact,
    required this.company,
    required this.created_at,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      email: json['email'],
      firstname: json['firstname'],
      secondname: json['secondname'],
      company_id: json['company_id'],
      type: json['type'],
      email_confirmed: json['email_confirmed'],
      actived: json['actived'],
      deleted: json['deleted'],
      iscontact: json['iscontact'],
      company: json['company'],
      created_at: json['created_at'],
    );
  }
}