import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:learning/models/todo.dart';
import 'package:learning/utils/text_helpers.dart';
import 'package:provider/provider.dart';
import 'package:learning/providers/todo_provider.dart';

class TodoListItem extends StatelessWidget {
  const TodoListItem({Key? key, required this.todo}) : super(key: key);

  final Todo todo;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Color(0xffeaeaea), width: 1),
          borderRadius: BorderRadius.all(Radius.circular(8))),
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  capitalize(todo.title),
                  style: Theme.of(context).textTheme.headline2,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(todo.desc,
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1!
                        .copyWith(color: Colors.orange),
                    overflow: TextOverflow.ellipsis)
              ],
            ),
          ),
          Expanded(
              child: todo.completedAt != null
                  ? Text(
                      'Completed',
                      style: TextStyle(color: Colors.green),
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        GestureDetector(
                            onTap: () {
                              context.read<TodoProvider>().deleteTodo(todo.id);
                            },
                            child: FaIcon(
                              FontAwesomeIcons.trash,
                              color: Colors.red,
                              size: 20,
                            )),
                        GestureDetector(
                            onTap: () {
                              context
                                  .read<TodoProvider>()
                                  .markTodoAsCompleted(todo.id);
                            },
                            child: FaIcon(
                              FontAwesomeIcons.check,
                              color: Colors.green,
                              size: 20,
                            ))
                      ],
                    ))
        ],
      ),
    );
  }
}
