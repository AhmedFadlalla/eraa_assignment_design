import 'package:eraa_soft/shared/component.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class TodoHomeList extends StatefulWidget {
  const TodoHomeList({Key? key}) : super(key: key);

  @override
  State<TodoHomeList> createState() => _TodoHomeListState();
}

class _TodoHomeListState extends State<TodoHomeList> {
  List<String> todoList = ['Go to Gym', 'Study hard', 'Go Home'];
  var taskController = TextEditingController();
  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: Text('TodoList'),
      ),
      body: ListView.separated(
          itemBuilder: (context, index) => Card(
                  child: ListTile(
                title: Text(todoList[index]),
              )),
          separatorBuilder: (context, index) => Divider(),
          itemCount: todoList.length),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(context: context, builder: (builder){
            return AlertDialog(
              title: Text("Add Task"),
              content: SingleChildScrollView(
                child: ListBody(
                  children: [
                    defaultTextField(
                        controller: taskController,
                        inputText: TextInputType.text,
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Task must not be empty';
                          }
                          return null;
                        },
                        label: 'Task'),
                    SizedBox(height: 15,),
                    defaultBottom(function: (){

                      if (kDebugMode) {
                        print("Add");
                      }
                        todoList.add(taskController.text);
                      if (kDebugMode) {
                        print(todoList);
                      }

                      Navigator.pop(context);

                    }, text: 'Add Task')
                  ],
                ),
              )
            );
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
