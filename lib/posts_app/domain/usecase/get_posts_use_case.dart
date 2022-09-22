import 'package:dartz/dartz.dart';
import 'package:eraa_soft/posts_app/core/error/failure.dart';
import 'package:eraa_soft/posts_app/core/use_case/base_use_case.dart';
import 'package:eraa_soft/posts_app/core/utils/constrant.dart';
import 'package:eraa_soft/posts_app/domain/entities/base_bost_data.dart';
import 'package:eraa_soft/posts_app/domain/repostory/base_posts_reposotry.dart';

class GetPostsUseCase extends BaseUseCase<List<BasePostData>,NoParameters>{
  BasePostsRepository basePostsRepository;

  GetPostsUseCase(this.basePostsRepository);

  @override
  Future<Either<Failure, List<BasePostData>>> call(NoParameters parameters1,) async{
    return await basePostsRepository.getPostsData();
  }


}