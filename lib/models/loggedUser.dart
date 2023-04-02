class loggedUser {
  final String body;

  loggedUser({
    required this.body,
});

  factory loggedUser.fromJson(Map<String, dynamic> json) {
    return loggedUser(
      body: json['body'],
    );
  }
}