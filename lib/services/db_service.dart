import 'package:agucareer/models/chats_model.dart';
import 'package:agucareer/models/message_model.dart';
import 'package:agucareer/models/user_model.dart';

abstract class DBService {
  Future<bool> saveUser(User user);
  Future<User> getUser(String userID);
  Future<bool> updateUser(String userID, Map<String, dynamic> map);
  Future<List<User>> getConnections(User user);
  Future<List<Chats>> getChats(String userID);
  Stream<List<Message>> getMessages(String fromID, String toID);
  Future<bool> sendMessage(Message message);
  Future<DateTime> getTime(String userID);
  Future<bool> markAsSeen(String me, String it);

}