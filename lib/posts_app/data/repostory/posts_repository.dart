import 'package:dartz/dartz.dart';
import 'package:eraa_soft/posts_app/core/error/failure.dart';
import 'package:eraa_soft/posts_app/core/utils/constrant.dart';
import 'package:eraa_soft/posts_app/data/models/post_model.dart';
import 'package:eraa_soft/posts_app/domain/entities/base_bost_data.dart';
import 'package:eraa_soft/posts_app/domain/repostory/base_posts_reposotry.dart';

import '../data_source/base_remote_data_source.dart';

class PostRepository implements BasePostsRepository{
  final BaseRemoteDataSource baseRemoteDataSource;

  PostRepository(this.baseRemoteDataSource);

  @override
  Future<Either<Failure, List<BasePostData>>> getPostsData()async {
    final result=await baseRemoteDataSource.getPostsData();

    try{
      return Right(result);
    }on ServerFailure catch(failure){
      return Left(ServerFailure(failure.message));
    }
  }

  @override
  Future<Either<Failure, PostModel>> addPosts(PostParameter parameter1) async{

    final result=await baseRemoteDataSource.addPost(parameter1);
    try{
      return Right(result);
    }on ServerFailure catch(failure){
      throw Left(ServerFailure(failure.message));
    }
  }



}