import 'package:cloud_firestore/cloud_firestore.dart';

class Chats{
  final String sender;
  final String receiver;
  final bool seen;
  final Timestamp date;
  final String last;
  final Timestamp seenDate;
  String name;
  String profileURL;

  Chats({this.sender, this.receiver, this.seen, this.date, this.last, this.seenDate});

  Map<String, dynamic> toMap(){
    return {
      'sender' : sender,
      'receiver' : receiver,
      'seen' : seen,
      'date' : date ?? FieldValue.serverTimestamp(),
      'last' : last,
      'seenDate' : seenDate ?? FieldValue.serverTimestamp(),
    };
  }

  Chats.fromMap(Map<String, dynamic> map):
        sender = map['sender'],
        receiver = map['receiver'],
        seen = map['seen'],
        date = map['date'],
        seenDate = map['seenDate'],
        last = map['last'];

  @override
  String toString() {
    return 'Chats{sender: $sender, receiver: $receiver, seen: $seen, date: $date, last: $last, seenDate: $seenDate}';
  }

}