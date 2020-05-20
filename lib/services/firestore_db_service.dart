import 'package:agucareer/models/chats_model.dart';
import 'package:agucareer/models/message_model.dart';
import 'package:agucareer/models/user_model.dart';
import 'package:agucareer/services/db_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreDBService implements DBService {
  final Firestore _firestore = Firestore.instance;

  @override
  Future<bool> saveUser(User user) async {
    await _firestore
        .collection("users")
        .document(user.userID)
        .setData(user.toMap());
    return true;
  }

  @override
  Future<User> getUser(String userID) async {
    DocumentSnapshot _userData =
        await Firestore.instance.document("users/$userID").get();
    return User.fromMap(_userData.data);
  }

  @override
  Future<bool> updateUser(String userID, Map<String, dynamic> map) async {
    await _firestore
        .collection("users")
        .document(userID)
        .setData(map, merge: true);
    return true;
  }

  @override
  Future<List<User>> getUserList() async {
    QuerySnapshot querySnapshot =
        await _firestore.collection("users").getDocuments();
    return querySnapshot.documents
        .map((user) => User.fromMap(user.data))
        .toList();
  }

  @override
  Future<List<Chats>> getChats(String userID) async {
    QuerySnapshot querySnapshot = await _firestore
        .collection("connections")
        .where("sender", isEqualTo: userID)
        .orderBy("date", descending: true)
        .getDocuments();
    return querySnapshot.documents
        .map((chat) => Chats.fromMap(chat.data))
        .toList();
  }

  @override
  Stream<List<Message>> getMessages(String fromID, String toID) {
    var snapshot = _firestore
        .collection("connections")
        .document(fromID + "." + toID)
        .collection("messages")
        .orderBy("date", descending: true)
        .snapshots();
    return snapshot.map((messageList) =>
        messageList.documents.map((m) => Message.fromMap(m.data)).toList());
  }

  @override
  Future<bool> sendMessage(Message message) async {
    var _messageID = _firestore.collection("connections").document().documentID;
    var _meID = message.from + "." + message.receiver;
    var _itID = message.receiver + "." + message.from;
    var _myData = message.toMap();
    var _itData = message.toMap();
    _itData['isMine'] = false;
    await _firestore
        .collection("connections")
        .document(_meID)
        .collection("messages")
        .document(_messageID)
        .setData(_myData);
    await _firestore.collection("connections").document(_meID).setData({
      "sender": message.from,
      "reciever": message.receiver,
      "last": message.message,
      "seen": false,
      "date": FieldValue.serverTimestamp(),
    });
    await _firestore
        .collection("connections")
        .document(_itID)
        .collection("messages")
        .document(_messageID)
        .setData(_itData);
    await _firestore.collection("connections").document(_itID).setData({
      "sender": message.receiver,
      "reciever": message.from,
      "last": message.message,
      "seen": false,
      "date": FieldValue.serverTimestamp(),
    });
    return true;
  }

  @override
  Future<DateTime> getTime(String userID) async {
    await _firestore.collection("server").document(userID).setData({
      "time" : FieldValue.serverTimestamp()
    });
    var map = await _firestore.collection("server").document(userID).get();
    Timestamp time = map.data["time"];
    return time.toDate();
  }
}
