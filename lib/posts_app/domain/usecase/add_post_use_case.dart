import 'package:dartz/dartz.dart';
import 'package:eraa_soft/posts_app/core/error/failure.dart';
import 'package:eraa_soft/posts_app/core/use_case/base_use_case.dart';
import 'package:eraa_soft/posts_app/core/utils/constrant.dart';
import 'package:eraa_soft/posts_app/domain/repostory/base_posts_reposotry.dart';

import '../entities/base_bost_data.dart';

class AddPostUseCase extends BaseUseCase<void,PostParameter>{
  BasePostsRepository basePostsRepository;

  AddPostUseCase(this.basePostsRepository);

  @override
  Future<Either<Failure, BasePostData>> call(PostParameter parameters1)async{
    return await basePostsRepository.addPosts(parameters1);
  }

}