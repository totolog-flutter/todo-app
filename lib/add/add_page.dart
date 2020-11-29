import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/main-model.dart';

class AddPage extends StatelessWidget {
  final MainModel model;
  AddPage(this.model);

  var formatter = new DateFormat('yyyy/MM/dd(E) HH:mm');

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
                    print('変数textの値：' + text);
                  },
                ),
                // Text(data)
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Taskの予定日時',
                  ),
                  onTap: () {
                    DatePicker.showDateTimePicker(context,
                        showTitleActions: true, onConfirm: (date) {
                      model.newTodoTime = formatter.format(date);
                    }, currentTime: DateTime.now(), locale: LocaleType.jp);
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
