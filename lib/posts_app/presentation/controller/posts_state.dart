import 'package:equatable/equatable.dart';
import 'package:eraa_soft/posts_app/core/utils/enum.dart';

import '../../domain/entities/base_bost_data.dart';

class PostsState extends Equatable {
  final List<BasePostData> postsData;
  final RequestState postsDataState;
  final String postsDataMessage;
  final BasePostData? sendPostsData;
  final RequestState sendPostsDataState;
  final String sendPostsDataMessage;

  PostsState({
    this.postsData = const [],
    this.postsDataState = RequestState.loading,
    this.postsDataMessage = '',
    this.sendPostsData,
    this.sendPostsDataState = RequestState.loading,
    this.sendPostsDataMessage = '',
  });

  PostsState copyWith(
      {List<BasePostData>? postsData,
      RequestState? postsDataState,
      String? postsDataMessage,
      BasePostData? sendPostsData,
      RequestState? sendPostsDataState,
      String? sendPostsDataMessage}) {
    return PostsState(
        postsData: postsData ?? this.postsData,
        postsDataState: postsDataState ?? this.postsDataState,
        postsDataMessage: postsDataMessage ?? this.postsDataMessage,
        sendPostsData: sendPostsData ?? this.sendPostsData,
        sendPostsDataState: sendPostsDataState ?? this.sendPostsDataState,
        sendPostsDataMessage: sendPostsDataMessage ?? this.sendPostsDataMessage);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
    postsData, postsDataState, postsDataMessage,
    sendPostsData,sendPostsDataState,sendPostsDataMessage
  ];
}
