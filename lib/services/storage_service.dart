import 'dart:io';

abstract class StorageService {
  Future<String> uploadProfilePhoto(String userID, File file);

}