import 'package:eraa_soft/modulus/note_app/note_app_details_screen.dart';
import 'package:eraa_soft/shared/component.dart';
import 'package:flutter/material.dart';
class NoteAppScreen extends StatefulWidget {
  const NoteAppScreen({Key? key}) : super(key: key);

  @override
  State<NoteAppScreen> createState() => _NoteAppScreenState();
}

class _NoteAppScreenState extends State<NoteAppScreen> {
  List<Map<String,dynamic>> notes=[
    {
     "title":"Gym Note",
     "description":"Bensh 40 repeat fekjfoiwjfo;iwjf;jfkSNDFO;isejfoifhkjfnsefihsei;uhfweihfkjsnfwkshf;iuewhfsekkjefniweufhuifewhiuh"
    },
    {
      "title":"Work Note",
      "description":"Bensh 40 repeat"
    },
  ];

  var titleController = TextEditingController();
  var descriptionController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Note App'),
      ),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: ListView.separated(
            itemBuilder: (context,index)=>InkWell(
              onTap: (){
                navigateTo(context,NoteDetailsScreen(
                    title:notes[index]["title"] ,
                    description: notes[index]["description"] ) );
              },
              child: Container(
                height: 100,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: Colors.blue
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,

                  children: [
                    Text(
                      notes[index]["title"],
                      style: const TextStyle(
                          fontSize: 25,
                        fontWeight: FontWeight.bold
                      ),
                    ),


                  ],
                ),
              ),
            ),
            separatorBuilder: (context,index)=>myDivider(),
            itemCount: notes.length),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          showDialog(context: context, builder: (builder){
            return AlertDialog(
                title: Text("Add Task"),
                content: SingleChildScrollView(
                  child: ListBody(
                    children: [
                      defaultTextField(
                          controller: titleController,
                          inputText: TextInputType.text,
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Title must not be empty';
                            }
                            return null;
                          },
                          label: 'Title'),
                      SizedBox(height: 15,),
                      defaultTextField(
                          controller: descriptionController,
                          inputText: TextInputType.text,
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Description must not be empty';
                            }
                            return null;
                          },
                          label: 'Description'),
                      SizedBox(height: 15,),
                      defaultBottom(function: (){

                       notes.add({
                         "title":titleController.text,
                         "description":descriptionController.text
                       });

                        Navigator.pop(context);

                      }, text: 'Add Note')
                    ],
                  ),
                )
            );
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
