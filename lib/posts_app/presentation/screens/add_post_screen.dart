import 'package:eraa_soft/posts_app/presentation/controller/posts_bloc.dart';
import 'package:eraa_soft/posts_app/presentation/controller/posts_state.dart';
import 'package:eraa_soft/shared/component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/services/service_locator.dart';
import '../controller/posts_event.dart';

class AddPostScreen extends StatelessWidget {
  int? postId;

  AddPostScreen({Key? key, this.postId}) : super(key: key);

  var textController = TextEditingController();
  var titleController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<PostsBloc>(),
      child: BlocBuilder<PostsBloc, PostsState>(builder: (context, state) {
        int userId = 28;
        return Scaffold(
          appBar: AppBar(
            title: const Text('Add Post'),
            actions: [
              IconButton(
                onPressed: () {
                  sl<PostsBloc>()
                    .add(AddPostEvent(userId:userId,
                        body:textController.text,
                        title:titleController.text,
                        postId:102
                    ));
                },
                icon: const Icon(Icons.upload),
              )
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              children: [
                Text(
                  '$userId',
                  style: Theme
                      .of(context)
                      .textTheme
                      .subtitle2!
                      .copyWith(fontWeight: FontWeight.w600, height: 1.2),
                ),
                TextFormField(
                  controller: titleController,
                  style: const TextStyle(color: Colors.black),

                ),
                const SizedBox(height: 8,),
                Expanded(
                  child: TextFormField(
                    decoration: const InputDecoration(
                        hintText: 'What is your Post Body ',
                        border: InputBorder.none),
                    controller: textController,
                    style: const TextStyle(color: Colors.black),
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
