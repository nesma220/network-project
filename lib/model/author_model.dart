class Author {
  int? userId;
  int? id;
  String? title;
  String? body;

  Author({this.userId, this.id, this.title, this.body});

  factory Author.fromJson(Map<String, dynamic> json) => Author(
        id: json['id'],
        userId: json['userId'],
        title: json['title'],
        body: json['body'],
      );

  Map<String, dynamic> toJson() => {
        'userId': userId,
        'id': id,
        'title': title,
        'body': body,
      };
}
