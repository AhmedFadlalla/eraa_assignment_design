import 'package:dartz/dartz.dart';
import 'package:eraa_soft/posts_app/core/error/failure.dart';
import 'package:eraa_soft/posts_app/core/utils/constrant.dart';
import 'package:eraa_soft/posts_app/domain/entities/base_bost_data.dart';
abstract class BasePostsRepository {

  Future<Either<Failure, List<BasePostData>>> getPostsData();

  Future<Either<Failure, BasePostData>> addPosts(PostParameter parameter1);
}