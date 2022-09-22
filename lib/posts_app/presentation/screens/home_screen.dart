import 'package:eraa_soft/posts_app/domain/entities/base_bost_data.dart';
import 'package:eraa_soft/posts_app/presentation/controller/posts_bloc.dart';
import 'package:eraa_soft/posts_app/presentation/controller/posts_event.dart';
import 'package:eraa_soft/posts_app/presentation/controller/posts_state.dart';
import 'package:eraa_soft/shared/component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../core/services/service_locator.dart';
import '../../core/utils/enum.dart';
import 'add_post_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => sl<PostsBloc>()..add(GetPostsEvent()),
      child: BlocBuilder<PostsBloc,PostsState>(
        builder: (context,state){
          
          switch(state.postsDataState){
            
            case RequestState.loading:
              return const Center(child: CircularProgressIndicator());
            case RequestState.loaded:
              var posts=state.postsData;
              return Scaffold(
                appBar: AppBar(
                  title: const Text('Feeds'),
                  actions: [
                   TextButton(onPressed: (){
                     navigateTo(context,  AddPostScreen(postId: posts.length,));
                   }, child: const Text(
                       'Upload Post',
                     style:  TextStyle(
                       color: Colors.black
                     ),
                   ))
                  ],
                ),
                body: Padding(
                  padding: const EdgeInsets.all(15),
                  child: ListView.separated(
                      itemBuilder: (context,index)=>buildPostItem(posts[index]),
                      separatorBuilder: (context,index)=>const SizedBox(height: 15,),
                      itemCount: posts.length
                  ),
                ),
              );
            case RequestState.error:
             return Center(child: Text(state.postsDataMessage));
          }
        },
        
      ),
    );
  }
  Widget buildPostItem(BasePostData data)=>Container(
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.grey.withOpacity(0.3)
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          data.title,
          style: GoogleFonts.notoSans(
              fontSize: 18,
              fontWeight: FontWeight.bold
          ),
        ),
        const SizedBox(height: 8,),
        Text(
          data.body,
          style: GoogleFonts.notoSans(
            fontSize: 12,

          ),
        ),

      ],
    ),
  );
}
