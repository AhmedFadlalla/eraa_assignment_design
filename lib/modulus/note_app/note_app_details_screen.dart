import 'package:flutter/material.dart';

class NoteDetailsScreen extends StatelessWidget {
  final String title;
  final String description;
  const NoteDetailsScreen({Key? key,required this.title,required this.description}) : super(key: key);

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
            Center(
                child:
                Text(
                  title,
                  style: const TextStyle(
                      fontSize: 25,
                    fontWeight: FontWeight.bold
                  ),
                )),
            SizedBox(height: 25,),
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
