import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:learning/providers/todo_provider.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class TodoForm extends StatefulWidget {
  const TodoForm({Key? key}) : super(key: key);

  @override
  _TodoFormState createState() => _TodoFormState();
}

class _TodoFormState extends State<TodoForm> {
  final _formkey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.white),
      padding: MediaQuery.of(context).viewInsets,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Add a Todo',
              style: Theme.of(context).textTheme.headline2,
            ),
            FormBuilder(
              key: _formkey,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 15),
                    child: Material(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      elevation: 3,
                      child: FormBuilderTextField(
                        name: 'title',
                        validator: (title) {
                          if (title == null || title.isEmpty) {
                            return 'Oops, We need Title to create a catchy todo';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                            border:
                                OutlineInputBorder(borderSide: BorderSide.none),
                            hintText: 'Todo Title',
                            hintStyle: TextStyle(
                                fontFamily: 'Poppins', color: Colors.grey),
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 5, horizontal: 15),
                            fillColor: Colors.black,
                            errorStyle: TextStyle(fontFamily: 'Poppins')),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 15),
                    child: Material(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      elevation: 3,
                      child: FormBuilderTextField(
                        name: 'desc',
                        validator: (desc) {
                          if (desc == null || desc.isEmpty) {
                            return 'Oops, We need description';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                            border:
                                OutlineInputBorder(borderSide: BorderSide.none),
                            hintText: 'Todo Description',
                            hintStyle: TextStyle(
                                fontFamily: 'Poppins', color: Colors.grey),
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 5, horizontal: 15),
                            fillColor: Colors.black),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Center(
              child: ElevatedButton(
                  onPressed: () {
                    _formkey.currentState!.save();
                    if (_formkey.currentState!.validate()) {
                      context.read<TodoProvider>().addTodo(
                          _formkey.currentState!.value['title'],
                          _formkey.currentState!.value['desc']);
                      Navigator.pop(context);
                    }
                  },
                  child: Text('Add')),
            )
          ],
        ),
      ),
    );
  }
}
