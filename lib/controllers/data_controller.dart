import 'dart:convert';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:take_note/models/note.dart';
import 'package:take_note/models/user.dart';
import 'package:uuid/uuid.dart';
import 'package:crypto/crypto.dart';

class DataController extends GetxController {
  List<Note> notes = <Note>[].obs;
  List<String> savedNotes = <String>[].obs;

  var loaded = false.obs;
  User? app_user;

  Future<void> serializeNotes() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (savedNotes.isEmpty) {
      savedNotes.clear();
  }

    for (int i = 0; i < notes.length; i++) {
      String note = json.encode(notes[i]);
      savedNotes.add(note);
      await prefs.setStringList('com.richard.Take_Note', savedNotes);
    }
  }

  void deserializeNotes() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var fromMem = prefs.getStringList('com.richard.Take_Note');
    if (fromMem != null) {
      savedNotes = fromMem.obs;
      notes.clear();
      for (int i = 0; i < savedNotes.length; i++) {
        Note note = Note.fromJson(json.decode(savedNotes[i]));
        notes.add(note);
      }
    }
    loaded.value = true;
  }

  Future<bool> createUser(String name, String email, String password) async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      var uuid = Uuid();
      var userId = uuid.v1();

      var bytes = utf8.encode(password);
      Digest digest = sha256.convert(bytes);
      var encryptedPassword = digest.toString();

      User newUser = User(
        id: userId,
        name: name,
        creationDate: DateTime.now(),
        email: email,
        password: encryptedPassword,
      );

      String userInfo = json.encode(newUser);
      await prefs.setString('com.richard.Take_Note_User', userInfo);
      return true;
  }

  Future<bool> getUser(String email, String password) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var savedUser = prefs.getString('com.richard.Take_Note_User');
    if (savedUser != null) {
      var user = User.fromJson(json.decode(savedUser));
      if (email == user.email) {

        var bytes = utf8.encode(password);
        Digest digest = sha256.convert(bytes);
        var encryptedPassword = digest.toString();

        if (encryptedPassword == user.password) {
          return true;
        } else {
          return false;
        }
      } else {
        return false;
      }
    }
    return false;
  }
}
