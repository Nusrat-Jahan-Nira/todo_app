import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/enum_value.dart';
import 'package:todo_app/my_todo.dart';
import 'package:todo_app/todo_item.dart';
import 'package:todo_app/todo_provider.dart';

class TodoPage extends StatefulWidget {
  const TodoPage({super.key});

  @override
  State<TodoPage> createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  final textController = TextEditingController();
  TodoPriority todoPriority = TodoPriority.Normal;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          addTodo();
        },
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        title: const Text('Todo App'),
      ),
      body: Consumer<TodoProvider>(
        builder:(context, provider, child) {
          if(provider.todos.isEmpty) {
            return   const Center(
              child: Text('Nothing to do!'),
            );
          }
          else{
            return ListView.builder(
                itemCount: provider.todos.length,
                itemBuilder: (context, index) {
                  final todos = provider.todos[index];
                  return TodoItem(
                      todo: todos,
                      onChanged: (value) {
                        provider.updateTodo(value,index);
                      });
                });
          }
        },
      ),
    );
  }

  void addTodo() {
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (context) => StatefulBuilder(
          builder:(context, setBuilderState) => Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
                  children: [
                    TextField(
                      controller: textController,
                      decoration: const InputDecoration(
                        label: Text('What to do?'),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('Select Priority'),
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Radio<TodoPriority>(
                            value: TodoPriority.Low,
                            groupValue: todoPriority,
                            onChanged: (value){
                              setBuilderState(() {
                                todoPriority = value!;
                              });
                            }),
                        Text(TodoPriority.Low.name),
                        Radio<TodoPriority>(
                            value: TodoPriority.Normal,
                            groupValue: todoPriority,
                            onChanged: (value){
                              setBuilderState(() {
                                todoPriority = value!;
                              });
                            }),
                        Text(TodoPriority.Normal.name),
                        Radio<TodoPriority>(
                            value: TodoPriority.High,
                            groupValue: todoPriority,
                            onChanged: (value){
                              setBuilderState(() {
                                todoPriority = value!;
                              });
                            }),
                        Text(TodoPriority.High.name),

                      ],
                    ),

                    ElevatedButton(
                        onPressed: (){
                          _save();
                        },
                        child: const Text('SAVE')
                    )
                  ],
                ),
          ),
        ));
  }

  void _save() {
     if(textController.text.isEmpty){
       showMsg(context,'Input field must not be empty');
       return;
     }

     final todo = MyTodo(
         id: DateTime.now().millisecondsSinceEpoch,
         name: textController.text,
         priority: todoPriority
     );

     Provider.of<TodoProvider>(context,listen: false).addTodo(todo);

     // MyTodo.todos.add(todo);
     textController.clear();
     Navigator.pop(context);

  }
}

void showMsg(BuildContext context, String s) {

  showDialog(context: context, builder: (context)=>AlertDialog(
    title: const Text('Caution!'),
    content: Text(s),
    actions: [
      TextButton(onPressed: ()=> Navigator.pop(context),
          child: const Text('CLOSE'))
    ],
  ));
}

