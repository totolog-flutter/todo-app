import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/add/add_model.dart';
import 'package:todo_app/main-model.dart';

class AddPage extends StatelessWidget {
  final MainModel model;
  AddPage(this.model);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<MainModel>.value(
      value: model,
      child: Scaffold(
        appBar: AppBar(
          title: Text('新規追加'),
        ),
        body: Consumer<MainModel>(builder: (context, model, child) {
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                TextField(
                  decoration: InputDecoration(
                    labelText: '追加するTODO',
                    hintText: '顔を洗う',
                  ),
                  onChanged: (text) {
                    model.newTodoText = text;
                  },
                ),
                SizedBox(
                  height: 16,
                ),
                RaisedButton(
                  child: Text('追加する'),
                  onPressed: () async {
                    await model.add();
                    Navigator.pop(context);
                  },
                )
              ],
            ),
          );
        }),
      ),
    );
  }
}
