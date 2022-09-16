import 'package:eraa_soft/modulus/note_app/database_helper.dart';
import 'package:eraa_soft/modulus/note_app/note_app_details_screen.dart';
import 'package:eraa_soft/shared/component.dart';
import 'package:flutter/material.dart';

class NoteAppScreen extends StatefulWidget {
  const NoteAppScreen({Key? key}) : super(key: key);

  @override
  State<NoteAppScreen> createState() => _NoteAppScreenState();
}

class _NoteAppScreenState extends State<NoteAppScreen> {
  var titleController = TextEditingController();
  var descriptionController = TextEditingController();

  DatabaseHelper databaseHelper = DatabaseHelper.instance;

  List<Widget> childern = [];
  var myNotes = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    databaseHelper.databse;
  }
  void addNote(String title,String description ) async {
    Map<String, dynamic> note = {
      DatabaseHelper.columnName1: title,
      DatabaseHelper.columnName2: description
    };
    final id = await databaseHelper.insert(note);
    print(id);
  }

  Future<bool> query() async {
    myNotes = [];
    childern = [];
    var allNotes = await databaseHelper.queryAll();
    allNotes.forEach((note) {
      myNotes.add(note.toString());
      childern.add(Card(
        elevation: 5.0,
        margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
        child: Container(
          padding: const EdgeInsets.all(5.0),
          child: ListTile(
            title: Center(
              child: Text(
                note["title"], // Value
                style: const TextStyle(fontSize: 18.0),
              ),
            ),
            leading: IconButton(
              onPressed: (){
                showDialog(
                    context: context,
                    builder: (builder) {
                      return StatefulBuilder(
                        builder: (context,builder){
                          titleController.text=note["title"];
                          descriptionController.text=note["description"];
                          return AlertDialog(
                              title: Text("Edit Task"),
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
                                    SizedBox(
                                      height: 15,
                                    ),
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
                                    SizedBox(
                                      height: 15,
                                    ),
                                    defaultBottom(
                                        function: () {
                                          databaseHelper.updateNote({
                                            DatabaseHelper.columnName1: titleController.text,
                                            DatabaseHelper.columnName2: descriptionController.text
                                          }, note["id"]);
                                          setState(() {
                                            Navigator.pop(context);
                                          });

                                        },
                                        text: 'Edit Note')
                                  ],
                                ),
                              ));
                        },
                      );
                    });
              },
              icon
                  :const Icon(Icons.edit),
            ),
            onLongPress: () {
              databaseHelper.deleteTodo(note['id']);
              setState(() {});
            },
          ),
        ),
      ));
    });
    return Future.value(true);
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Note App'),
      ),
      body: FutureBuilder(
        future: query(),
          builder: (context, snapShot) {
          if(snapShot.hasData){
            return SingleChildScrollView(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: childern
              ),
            );
          }else if(snapShot.hasError){
            return const Center(
          child: CircularProgressIndicator(

          ),
          );
          }
          else{
            return const Center(
              child: Text('error'),
            );
            }
        // return Padding(
        //   padding: EdgeInsets.all(15),
        //   child: ListView.separated(
        //       itemBuilder: (context, index) => InkWell(
        //             onTap: () {
        //               // navigateTo(context,NoteDetailsScreen(
        //               //     title:notes[index]["title"] ,
        //               //     description: notes[index]["description"] ) );
        //             },
        //             child: Container(
        //               height: 100,
        //               width: double.infinity,
        //               decoration: BoxDecoration(
        //                   borderRadius: BorderRadius.circular(25),
        //                   color: Colors.blue),
        //               child: Column(
        //                 mainAxisAlignment: MainAxisAlignment.center,
        //                 children: [
        //                   Text(
        //                     notes[index]["title"],
        //                     style: const TextStyle(
        //                         fontSize: 25, fontWeight: FontWeight.bold),
        //                   ),
        //                 ],
        //               ),
        //             ),
        //           ),
        //       separatorBuilder: (context, index) => myDivider(),
        //       itemCount: 3),
        // );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (builder) {
                return StatefulBuilder(
                  builder: (context,builder){
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
                              SizedBox(
                                height: 15,
                              ),
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
                              SizedBox(
                                height: 15,
                              ),
                              defaultBottom(
                                  function: () {
                                    addNote(titleController.text,descriptionController.text);
                                    setState(() {
                                      Navigator.pop(context);
                                    });
                                  },
                                  text: 'Add Note')
                            ],
                          ),
                        ));
                  },
                );
              });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
