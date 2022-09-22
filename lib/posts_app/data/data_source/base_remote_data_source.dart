import 'dart:convert';

import 'package:eraa_soft/posts_app/core/error/exceptions.dart';
import 'package:eraa_soft/posts_app/core/utils/constrant.dart';
import 'package:eraa_soft/posts_app/data/models/post_model.dart';
import 'package:eraa_soft/posts_app/domain/repostory/base_posts_reposotry.dart';
import 'package:http/http.dart' as http;

import '../../core/network/error_result_model.dart';
import '../../core/utils/app_constant.dart';

abstract class BaseRemoteDataSource {
  Future<List<PostModel>> getPostsData();

  Future<PostModel> addPost(PostParameter parameter1);
}

class RemoteDataSource extends BaseRemoteDataSource {
  @override
  Future<List<PostModel>> getPostsData() async {
    final response = await http.get(Uri.parse(AppContances.getPostsUrl));

    if (response.statusCode == 200) {
      return List<PostModel>.from((jsonDecode(response.body) as List)
          .map((e) => PostModel.fromJson(e)));
    } else {
      throw ServerException(
          errorResultModel:
              ErrorResultModel.fromJson((jsonDecode(response.body))));
    }
  }

  @override
  Future<PostModel> addPost(PostParameter parameter1) async {

    final http.Response response =
        await http.post(Uri.parse(AppContances.getPostsUrl), headers: {
          "Content-Type":"application/json"
        },
            body:jsonEncode( <String,dynamic>{
      "userId": parameter1.userId,
      "id": parameter1.postId,
      "title": parameter1.title,
      "body": parameter1.body
    })
    );
    return PostModel.fromJson(jsonDecode(response.body));
  }
}
