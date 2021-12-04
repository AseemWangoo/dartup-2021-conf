import 'dart:convert';

PostRequestModel postRequestModelFromJson(String str) =>
    PostRequestModel.fromJson(json.decode(str));

String postRequestModelToJson(PostRequestModel data) =>
    json.encode(data.toJson());

class PostRequestModel {
  PostRequestModel({
    required this.name,
  });

  String name;

  factory PostRequestModel.fromJson(Map<String, dynamic> json) =>
      PostRequestModel(
        name: json['name'],
      );

  Map<String, dynamic> toJson() => {
        'name': name,
      };
}
