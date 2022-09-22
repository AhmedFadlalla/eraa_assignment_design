import 'package:eraa_soft/posts_app/domain/entities/base_bost_data.dart';

class PostModel extends BasePostData{
  PostModel({required super.userId, required super.id, required super.title, required super.body});

  factory PostModel.fromJson(Map<String,dynamic>json){
    return PostModel(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
        body: json["body"]);
  }
}