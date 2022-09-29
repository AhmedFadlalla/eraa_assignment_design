import 'package:flutter/material.dart';

import '../../domain/entities/message_data.dart';
import 'compenents/compenents.dart';
import 'compenents/list_of_message.dart';
import 'compenents/list_of_users.dart';

class ChatHomeScreen extends StatelessWidget {
  const ChatHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var searchController=TextEditingController();
    return Scaffold(
      backgroundColor: Colors.black,
     body: Padding(
       padding: const EdgeInsets.all(25.0),
       child: Column(
         children: [
           const SizedBox(height: 15,),
           Row(
             children: [
               CircleAvatar(
                 radius: 15,
                 backgroundImage: NetworkImage(baseMessageData[0].image),
               ),
               const Spacer(),
               const CircleAvatar(
                 radius: 20,
                 backgroundColor: Colors.grey,
                 child: Icon(Icons.camera_alt, color: Colors.white,),
               ),
               const SizedBox(width: 8,),
               const CircleAvatar(
                 radius: 20,
                 backgroundColor: Colors.grey,
                 child: Icon(
                     Icons.edit,
                   color: Colors.white,
                 )
                 ,
               ),




             ],
           ),
           const SizedBox(height: 15,),
           defaultSearchField(
               controller:searchController ,
               type: TextInputType.text,
               validator: (value){
                 if(value.isEmpty){
                   return 'Search must not be empty';
                 }
                 return null;
               },
               prefixIcon: Icons.search,
               label: "Search"
           ),
           const SizedBox(height: 15,),
           const ListOfUsersData(),
           const SizedBox(height: 15,),
           const ListOfMessage()

         ],
       ),
     ),
    );
  }
}
