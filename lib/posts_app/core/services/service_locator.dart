
import 'package:eraa_soft/posts_app/data/data_source/base_remote_data_source.dart';
import 'package:eraa_soft/posts_app/data/repostory/posts_repository.dart';
import 'package:eraa_soft/posts_app/domain/repostory/base_posts_reposotry.dart';
import 'package:eraa_soft/posts_app/domain/usecase/add_post_use_case.dart';
import 'package:eraa_soft/posts_app/domain/usecase/get_posts_use_case.dart';
import 'package:eraa_soft/posts_app/presentation/controller/posts_bloc.dart';
import 'package:get_it/get_it.dart';


final sl=GetIt.instance;
class ServicesLocator{
  void init(){
    //Bloc


    sl.registerLazySingleton<PostsBloc>(() =>PostsBloc(sl(),addPostUseCase: sl()));
    // كل ما بنادي ع بلوك هيعمل نيو اوبجكت علشان يجيب الداتا جديده
    //use case

    sl.registerLazySingleton<GetPostsUseCase>(() =>GetPostsUseCase(sl()));
    sl.registerLazySingleton<AddPostUseCase>(() =>AddPostUseCase(sl()));
    //Repository
    sl.registerLazySingleton<BasePostsRepository>(() =>PostRepository(sl()) );
    //data source
    sl.registerLazySingleton<BaseRemoteDataSource>(() =>RemoteDataSource());
  }

}