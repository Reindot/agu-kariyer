import 'package:flutter/cupertino.dart';

enum UserTypes {MOD, STUDENT, MENTOR}

class User {
  final String userID;
  final String email;
  String profileURL;
  String type;
  String name;
  String bio;
  String professional;
  String company;
  String mentorID;
  String modID;

  User({@required this.userID, @required this.email});

  Map<String, dynamic> toMap() {
    return {
      'userID': userID,
      'email' : email,
      'profileURL' :profileURL ?? 'https://firebasestorage.googleapis.com/v0/b/agucareer-01.appspot.com/o/profile-photos%2Fdefault.jpg?alt=media&token=7b51d2e6-5e86-45ba-b6a3-885cbff8205e',
      'type' : type ?? '',
      'name' : name ?? '',
      'bio' : bio ?? '',
      'professional' : professional ?? '',
      'company' : company ?? '',
      'mentorID' : mentorID ?? '',
      'modID' : modID ?? '',

    };
  }

  User.fromMap(Map<String, dynamic> map):
        userID = map['userID'],
        email = map['email'],
        profileURL = map['profileURL'],
        type = map['type'],
        name = map['name'],
        bio = map['bio'],
        professional = map['professional'],
        mentorID = map['mentorID'],
        modID = map['modID'],
        company = map['company'];

  @override
  String toString() {
    return 'User{userID: $userID, email: $email, profileURL: $profileURL, type: $type, name: $name, bio: $bio, professional: $professional, company: $company, mentorID: $mentorID, modID: $modID}';
  }

}
