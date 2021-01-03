import 'package:fckapi/core/models/note.dart';
import 'package:fckapi/core/services/rest_fire_service.dart';
import 'package:fckapi/views/widgets/custom_appbar.dart';
import 'package:fckapi/views/widgets/custom_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_button/custom/hover_button.dart';
import 'package:flutter_button/custom/opacity_button.dart';

class AddNote extends StatefulWidget {
  const AddNote({Key key}) : super(key: key);

  @override
  _AddNoteState createState() => _AddNoteState();
}

class _AddNoteState extends State<AddNote> {
  var fireService = RestFireService();
  String title = "";
  String description = "";
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildCustomAppBar(context),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Form(
            key: _formKey, 
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                buildTitleField(),
                SizedBox(height: 10),
                buildDesField(),
                SizedBox(height: 20),
                AnimatedHoverButton(
                  title: "Save Note",
                  borderRadius: BorderRadius.circular(10),
                  onTap: () async {
                    if (_formKey.currentState.validate()) {
                      bool result = await fireService.postNote(
                        Note(
                          title: title,
                          description: description,
                        ),
                      );
                      Navigator.pop(context);
                      setState(() {});
                    }
                  },
                  duration: Duration(milliseconds: 100),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  CustomField buildDesField() {
    return CustomField(
      hint: "Bla bla bla blaa",
      maxLines: 10,
      onChanged: (val) {
        description = val;
      },
    );
  }

  CustomField buildTitleField() {
    return CustomField(
      hint: "Title",
      validation: (val) {
        if (val.length < 2) {
          return "Title must to provide 2 charachter";
        }
      },
      onChanged: (val) {
        title = val;
      },
    );
  }

  CustomAppBar buildCustomAppBar(BuildContext context) {
    return CustomAppBar(
      title: "Add Note",
      leading: Padding(
        padding: const EdgeInsets.only(left: 20, bottom: 10),
        child: OpacityButton(
          child: Icon(Icons.arrow_back_ios, color: Colors.black),
          onTap: () => Navigator.pop(context),
          opacityValue: .3,
        ),
      ),
    );
  }
}
