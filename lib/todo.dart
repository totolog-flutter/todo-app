import 'package:cloud_firestore/cloud_firestore.dart';

class Todo {
  Todo(DocumentSnapshot doc) {
    this.documentReference = doc.reference;
    this.title = doc.data()['title'];

    final Timestamp timestamp = doc.data()['createdAt'];
    this.createdAt = timestamp.toDate();

    this.schedule = doc.data()['schedule'];
  }
  String title;
  DateTime createdAt;
  String schedule;
  bool isDone = false;
  DocumentReference documentReference;
}
