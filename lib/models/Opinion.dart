class Opinion {
  final String id;
  final String headline;
  final String description;
  final String plague_id;
  final String num_likes;

  Opinion({
    required this.id,
    required this.headline,
    required this.description,
    required this.plague_id,
    required this.num_likes
  });

  factory Opinion.fromJson(Map<String, dynamic> json) {
    return Opinion(
      id: json['id'],
      headline: json['json'],
      description: json['description'],
      plague_id: json['plague_id'],
      num_likes: json['num_likes']
    );
  }
}