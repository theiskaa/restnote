import 'package:flutter/material.dart';
import 'package:flutter_button/custom/opacity_button.dart';
import 'package:google_fonts/google_fonts.dart';

class NoteCard extends StatelessWidget {
  final String title;
  final String description;
  final Function onTap;

  const NoteCard({
    Key key,
    this.title,
    this.description,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Card(
        shape: buildBoxShape(),
        child: Center(
          child: ListTile(
            title: buildTitle(),
            subtitle: buildSubtitle(),
            trailing: buildDeleteButton(),
          ),
        ),
      ),
    );
  } 

  RoundedRectangleBorder buildBoxShape() {
    return RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(25),
      side: BorderSide(width: 2),
    );
  }

  Text buildSubtitle() {
    return Text(
      description,
      style: GoogleFonts.indieFlower(
        fontSize: 18,
        color: Colors.black.withOpacity(.8),
      ),
    );
  }

  Text buildTitle() {
    return Text(
      title,
      style: GoogleFonts.indieFlower(
        fontSize: 23,
      ),
    );
  }

  OpacityButton buildDeleteButton() {
    return OpacityButton(
      child: Icon(
        Icons.delete,
        color: Colors.black,
        size: 30,
      ),
      onTap: onTap,
      opacityValue: .5,
    );
  }
}
