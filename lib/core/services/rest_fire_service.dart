import 'dart:convert';
import 'dart:io';

import 'package:fckapi/core/models/note.dart';
import 'package:http/http.dart' as http;

class RestFireService {
  static const FIREBASE_API =
      "[your firebase realtime database's url]";

  Future<List<Note>> fetchNotes() async {
    var response = await http.get("$FIREBASE_API/notes.json");
    switch (response.statusCode) {
      case HttpStatus.ok:
        var jsonBody = jsonDecode(response.body) as Map;
        var noteList = <Note>[];

        if (jsonBody != null) {
          jsonBody.forEach(
            (key, value) {
              var note = Note.fromJson(value);
              note.key = key;
              noteList.add(note);
            },
          );
        } else {
          return noteList;
        }

        return noteList;
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
