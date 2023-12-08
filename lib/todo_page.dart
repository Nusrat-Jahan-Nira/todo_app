
import 'package:flutter/material.dart';
import 'package:todo_app/enum_value.dart';
import 'package:todo_app/my_todo.dart';
import 'package:todo_app/todo_item.dart';

class TodoPage extends StatefulWidget {
  const TodoPage({super.key});

  @override
  State<TodoPage> createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _settingModalBottomSheet(context);
        },
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        title: const Text('Todo App'),),
      body:MyTodo.todos.isEmpty?
      const Center(child: Text('Nothing to do!'),):
      ListView.builder(
        itemCount: MyTodo.todos.length,
          itemBuilder: (context,index){
            final todos = MyTodo.todos[index];
            return TodoItem(todo: todos, onChanged: (value){

              setState(() {
                MyTodo.todos[index].completed = value;
              });

            });
          }
      ),
    );
  }
}
  void _settingModalBottomSheet(context){
    final textController = TextEditingController();

    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc){
          return Wrap(
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
          );
        }
    );

}
