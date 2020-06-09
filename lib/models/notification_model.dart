import 'package:cloud_firestore/cloud_firestore.dart';

class Notifications{
  final String profileURL;
  final Timestamp date;
  final String type;
  final String text;
  final String title;
  final String receiver;
  final String meetingID;



  Notifications({this.profileURL, this.date, this.type, this.text, this.receiver, this.title, this.meetingID});

  Map<String, dynamic> toMap(){
    return {
      'text' : text,
      'receiver' : receiver ?? "ALL",
      'profileURL' : profileURL ?? "",
      'meetingID' : meetingID,
      'date' : date ?? FieldValue.serverTimestamp(),
      'type' : type,
    };
  }

  Notifications.fromMap(Map<String, dynamic> map):
        text = map['text'],
        receiver = map['receiver'],
        profileURL = map['profileURL'],
        type = map['type'],
        meetingID = map['meetingID'],
        title = map['title'],
        date = map['date'];
}