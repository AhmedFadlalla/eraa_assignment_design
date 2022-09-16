import 'package:eraa_soft/shared/component.dart';
import 'package:flutter/material.dart';

class NoteDetailsScreen extends StatelessWidget {
  final String title;
  final String description;
  final int id;
   NoteDetailsScreen({Key? key,required this.title,required this.description,required this.id}) : super(key: key);

  final  titleController=TextEditingController();
  final  descriptionController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Note Data'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            defaultTextField(controller: titleController,
                inputText: TextInputType.text,
                validator: (value){
              if(value.isEmpty){
                return 'Title must not be empty';
              }
              return null;
                },
                label: 'Title'),
            SizedBox(height: 25,),
            defaultTextField(controller: descriptionController,
                inputText: TextInputType.text,
                validator: (value){
                  if(value.isEmpty){
                    return 'Title must not be empty';
                  }
                  return null;
                },
                label: 'Title'),
            Text(
              description,
              style: const TextStyle(
                  fontSize: 18,

              ),
            )
          ],
        ),
      ),
    );
  }
}
