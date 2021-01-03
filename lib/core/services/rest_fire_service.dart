import 'dart:convert';
import 'dart:io';

import 'package:fckapi/core/models/note.dart';
import 'package:http/http.dart' as http;

class RestFireService {
  static const FIREBASE_API =
      "https://rest-test-4e1e5-default-rtdb.firebaseio.com";

  Future<List<Note>> fetchNotes() async {
    var response = await http.get("$FIREBASE_API/notes.json");
    switch (response.statusCode) {
      case HttpStatus.ok:
        var jsonBody = jsonDecode(response.body) as Map;
        var noteList = <Note>[];
        jsonBody.forEach(
          (key, value) {
            var note = Note.fromJson(value);
            note.key = key;
            noteList.add(note);
          },
        );

        if (noteList != null) {
          return noteList;
        } else
          return [];
        break;
      default:
        return [];
    }
  }

  Future postNote(Note note) async {
    var jsonBody = jsonEncode(note.toJson());
    final response =
        await http.post("$FIREBASE_API/notes.json", body: jsonBody);
    switch (response.statusCode) {
      case HttpStatus.ok:
        return true;
        break;
      default:
        return false;
    }
  }

  Future deleteNote(Note note) async {
    final response = await http.delete(
      "$FIREBASE_API/notes/${note.key}.json",
    );
    switch (response.statusCode) {
      case HttpStatus.ok:
        return true;
        break;
      default:
        return false;
    }
  }
}
