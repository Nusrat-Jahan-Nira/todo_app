
import 'package:flutter/material.dart';
import 'package:todo_app/enum_value.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _settingModalBottomSheet(context);
        },
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        title: const Text('Todo App'),),
      body: const Center(),
    );
  }
}
  void _settingModalBottomSheet(context){
    final textController = TextEditingController();

    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc){
          return Container(
            child:  Wrap(
              children: <Widget>[
                 ListTile(
                    leading:  const Icon(Icons.note_add_outlined),
                    title:  TextField(
                      controller: textController,
                      decoration:  const InputDecoration(
                          label: Text('What to do?'),
                      ),
                    ),
                    onTap: () => {}
                ),
                 ListTile(
                  title:  const Center(child: Text('Select Priority')),
                  onTap: () => {},
                ),

                Row(
                  children: [
                    Radio<TodoPriority>(
                        value: TodoPriority.Low,
                        groupValue: null,
                        onChanged: (value) {

                        }),
                    const Text('Low'),
                    Radio<TodoPriority>(
                        value: TodoPriority.Normal,
                        groupValue: null,
                        onChanged: (value) {

                        }),
                    const Text('Normal'),
                    Radio<TodoPriority>(
                        value: TodoPriority.High,
                        groupValue: null,
                        onChanged: (value) {

                        }),
                    const Text('High'),
                  ],
                ),

                Center(
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        textStyle: const TextStyle(
                          color: Colors.white
                        )
                      ),
                      onPressed: () {

                  },
                      child: const Text('SAVE')),
                )

              ],
            ),
          );
        }
    );

}
