import 'package:equatable/equatable.dart';

abstract class PostsEvent extends Equatable{

  PostsEvent();
  @override
  List<Object?> get props => [];
}
class GetPostsEvent extends PostsEvent{}
class AddPostEvent extends PostsEvent{

  final int userId ;
  final int postId;
  final String title;
  final String body;

  AddPostEvent({
    required this.userId,
    required this.postId,
    required this.title,
    required this.body
  });
}