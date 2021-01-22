import 'package:fckapi/core/models/note.dart';
import 'package:fckapi/core/services/rest_fire_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockDatabase extends Mock implements RestFireService {}

void main() {
  // MockDatabase mockDatabase;
  RestFireService restFireService;
  List<Note> allNotes;
  var divider =
      "========================================================================================================";

  setUp(() async {
    restFireService = RestFireService();
    allNotes = await restFireService.fetchNotes();
    // mockDatabase = MockDatabase();
  });

  test(
    "Fetch Notes",
    () async {
      final response = await restFireService.fetchNotes();
      expect(response is List<Note>, true);
      expect(response != null, true);
      expect(response.length > 0, true);
      print("Fire DB has: ${response.length} item");
      print(divider);
    },
  );

  test(
    "Post Note",
    () async {
      final response = await restFireService.postNote(
        Note(
          title: "Test Title",
          description: "Test Description",
        ),
      );
      expect(response != null && response != false, true);
      print(divider);
    },
  );

  test(
    "Delete Note",
    () async {
      int noteLenght = allNotes.length - 1;
      final response = await restFireService.deleteNote(
        Note(
          key: allNotes[noteLenght].key,
          title: allNotes[noteLenght].title,
          description: allNotes[noteLenght].description,
        ),
      );
      expect(response != null && response != false, true);
      print(divider);
    },
  );
}
