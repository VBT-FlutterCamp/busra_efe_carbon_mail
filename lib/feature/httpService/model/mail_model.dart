import 'dart:convert';

List<MailModel> mailModelFromJson(String str) =>
    List<MailModel>.from(json.decode(str).map((x) => MailModel.fromJson(x)));

String mailModelToJson(List<MailModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MailModel {
  MailModel({
    this.userId,
    this.id,
    this.title,
    this.completed,
  });

  int? userId;
  int? id;
  String? title;
  bool? completed;

  factory MailModel.fromJson(Map<String, dynamic> json) => MailModel(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
        completed: json["completed"],
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "id": id,
        "title": title,
        "completed": completed,
      };
}
