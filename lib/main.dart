import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/main-model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todoアプリ',
      home: ChangeNotifierProvider<MainModel>(
        create: (_) => MainModel()..getTodoListRealTime(),
        child: Scaffold(
          appBar: AppBar(
            title: Text('Todoアプリ'),
          ),
          body: Consumer<MainModel>(builder: (context, model, child) {
            final todoList = model.todoList;
            return ListView(
              children: todoList
                  .map(
                    (todo) => ListTile(
                      title: Text(todo.title),
                      subtitle: Text(todo.createdAt),
                    ),
                  )
                  .toList(),
            );
          }),
          floatingActionButton: FloatingActionButton(
            onPressed: () {},
            tooltip: 'Increment',
            child: Icon(Icons.add),
          ),
        ),
      ),
    );
  }
}
