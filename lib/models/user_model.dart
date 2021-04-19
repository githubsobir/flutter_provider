class UserModels {
  int userId;
  int id;
  String title;
  String body;

  UserModels({
    this.userId,
    this.id,
    this.title,
    this.body,
  });

  factory UserModels.fromJson(Map<String, dynamic> json) => UserModels(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
        body: json["body"],
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "id": id,
        "title": title,
        "body": body,
      };
}
