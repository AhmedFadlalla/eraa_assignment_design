import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:eraa_soft/posts_app/presentation/controller/posts_event.dart';
import 'package:eraa_soft/posts_app/presentation/controller/posts_state.dart';
import 'package:meta/meta.dart';

import '../../core/use_case/base_use_case.dart';
import '../../core/utils/constrant.dart';
import '../../core/utils/enum.dart';
import '../../domain/usecase/add_post_use_case.dart';
import '../../domain/usecase/get_posts_use_case.dart';

class PostsBloc extends Bloc<PostsEvent, PostsState> {
  final GetPostsUseCase getPostsUseCase;
  AddPostUseCase? addPostUseCase;

  PostsBloc(this.getPostsUseCase, {this.addPostUseCase}) : super(PostsState()) {
    on<GetPostsEvent>((event, emit) async {
      final result = await getPostsUseCase(const NoParameters());
      result.fold(
          (l) => emit(state.copyWith(
              postsDataState: RequestState.error, postsDataMessage: l.message)),
          (r) => emit(state.copyWith(
              postsData: r, postsDataState: RequestState.loaded)));
    });

    on<AddPostEvent>((event, emit) async {
      final result = await addPostUseCase!(PostParameter(
        userId: event.userId,
        postId: event.postId,
        title: event.title,
        body: event.body,
      ));
      result.fold(
          (l) => emit(state.copyWith(
              sendPostsDataState: RequestState.error,
              sendPostsDataMessage: l.message??""
          )),
          (r) => emit(state.copyWith(
              sendPostsData: r,
              sendPostsDataState: RequestState.loaded)));
    });
  }
}
