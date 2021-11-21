import 'package:flutter/material.dart';
import 'package:learning/components/todo_list_item.dart';
import 'package:learning/models/todo.dart';
import 'package:provider/provider.dart';
import 'package:learning/providers/todo_provider.dart';
import 'package:learning/components/todo_form.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    List<Todo> todoList = context.watch<TodoProvider>().todos;
    print(todoList);
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Container(
          decoration: const BoxDecoration(color: Colors.white),
          padding: EdgeInsets.only(top: 24),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Hi Jagadish!',
                            style: Theme.of(context).textTheme.headline1),
                        Text(
                            '${context.watch<TodoProvider>().todos.length} todos left',
                            style: Theme.of(context)
                                .textTheme
                                .headline3!
                                .copyWith(color: Colors.orange))
                      ],
                    ),
                    Image(
                        image: AssetImage('avatar.png'),
                        fit: BoxFit.cover,
                        width: 36,
                        height: 36)
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.orange)),
                          onPressed: () {
                            showModalBottomSheet<void>(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.vertical(
                                        top: Radius.circular(20))),
                                backgroundColor: Colors.white,
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                context: context,
                                isScrollControlled: true,
                                builder: (BuildContext context) {
                                  return TodoForm();
                                });
                          },
                          child: Stack(
                            children: const [
                              Text(
                                'Add Todo',
                                style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          )),
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: ListView.builder(
                  primary: false,
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: todoList.length,
                  itemBuilder: (context, index) {
                    return TodoListItem(todo: todoList[index]);
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
