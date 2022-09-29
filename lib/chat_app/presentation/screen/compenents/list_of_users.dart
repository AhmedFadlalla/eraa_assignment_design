import 'package:flutter/material.dart';

import '../../../domain/entities/message_data.dart';

class ListOfUsersData extends StatelessWidget {
  const ListOfUsersData({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
        height: 50,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
            itemBuilder: (context,index)=>Stack(
              alignment: AlignmentDirectional.bottomEnd,
              children: [
                CircleAvatar(
                  radius: 25,
                  backgroundImage:NetworkImage(baseMessageData[index].image) ,
                ),
                if(baseMessageData[index].isActive==true)
                  Container(
                    width: 15,
                    height: 15,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.green
                    ),
                  )
              ],
            ),
            separatorBuilder: (context,index)=>const SizedBox(width: 10,),
            itemCount: baseMessageData.length)
    );
  }
}
