import 'package:flutter/material.dart';

import '../../../domain/entities/message_data.dart';

class ListOfMessage extends StatelessWidget {
  const ListOfMessage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListView.separated(
            itemBuilder: (context,index)=>Row(
              children: [
                Stack(
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
                const SizedBox(width: 10,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                        baseMessageData[index].name,
                      style:const  TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    const SizedBox(height: 8,),
                    Text(
                        baseMessageData[index].message,
                      style:const  TextStyle(
                          color: Colors.grey
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                Text(
                    baseMessageData[index].dateTime,
                  style:const  TextStyle(
                      color: Colors.grey
                  ),
                )
              ],
            ),
            separatorBuilder: (context,index)=>const SizedBox(height: 8,),
            itemCount:baseMessageData.length ));
  }
}
