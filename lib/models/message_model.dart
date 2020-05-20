import 'package:cloud_firestore/cloud_firestore.dart';

class Message{
  final String from;
  final String receiver;
  final bool isMine;
  final String message;
  final Timestamp date;

  Message({this.from, this.receiver, this.isMine, this.message, this.date});

  Map<String, dynamic> toMap(){
    return {
      'from' : from,
      'receiver' : receiver,
      'isMine' : isMine,
      'message' : message,
      'date' : date ?? FieldValue.serverTimestamp(),
    };
  }

  Message.fromMap(Map<String, dynamic> map):
        from = map['from'],
        receiver = map['receiver'],
        isMine = map['isMine'],
        message = map['message'],
        date = map['date'];

  @override
  String toString() {
    return 'Message{from: $from, receiver: $receiver, isMine: $isMine, message: $message, date: $date}';
  }

}