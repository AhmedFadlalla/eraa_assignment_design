import 'package:equatable/equatable.dart';

class PostParameter extends Equatable{
   final int userId ;
   final  int postId;
   final String title;
   final String body;

  PostParameter({
     required this.userId,
    required this.postId,
    required this.title,
    required this.body
  });

  @override
  // TODO: implement props
  List<Object?> get props => [userId,postId,title,body];

}
