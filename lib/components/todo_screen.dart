import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sample_project2/providers/provider_todo.dart';

class TodoScreen extends StatelessWidget {
  const TodoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final prov = context.watch<TodoProvider>();
    TextEditingController controller = TextEditingController();
    return Scaffold(
      //resizeToAvoidBottomInset: false,
      body: Padding(
        padding: .symmetric(horizontal: 10),
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              spacing: 10,
              mainAxisSize: .min,
              children: [
                Text("Completed todo : ${prov.completeCount}"),
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: prov.todos.length,
                    itemBuilder: (context,index){
                      return Dismissible(
                        key: ValueKey(prov.todos[index]),
                        background: Container(color:Colors.redAccent),
                        onDismissed: (direction) {
                          context.read<TodoProvider>().removeTodo(index);
                        },
                        child: Card(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Checkbox(
                                      value: prov.todos[index].complete,
                                      onChanged: (val){
                                      context.read<TodoProvider>().toggleTodo(index);
                                      }
                                  ),
                                  Text("todo: $index - ${prov.todos[index].title}"),
                                ],
                              ),
                            )),
                      );
                    }),
                TextField(
                  controller: controller,
                ),
                TextButton(onPressed: (){
                  context.read<TodoProvider>().addTodo(controller.text);
                },
                    child: Text("add Todo"))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
