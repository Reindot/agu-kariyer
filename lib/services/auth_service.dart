import 'package:agucareer/models/user_model.dart';

abstract class AuthService {
  Future<User> currentUser();
  Future<User> signIn(String email, String password);
  Future<bool> signOut();
  Future<bool> resetPassword(String email);
  Future<User> createUser(String email, String password);

}
