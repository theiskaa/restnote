import 'package:fckapi/views/add_note.dart';
import 'package:flutter/material.dart';
import 'package:flutter_button/fabs/custom_fab.dart';

AnimatedCustomFAB buildAnimatedCustomFAB(BuildContext context) {
  return AnimatedCustomFAB(
    child: Container(
      decoration: buildBoxDecoration(),
      child: Icon(Icons.add, color: Colors.black),
    ),
    backgroundColor: Colors.white,
    borderRadius: buildBorderRadius(),
    shadows: buildBoxShadows(),
    onTap: () => Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AddNote(),
      ),
    ),
  );
}

BorderRadius buildBorderRadius() {
  return BorderRadius.only(
    topRight: Radius.circular(30),
    bottomLeft: Radius.circular(30),
    topLeft: Radius.circular(5),
    bottomRight: Radius.circular(5),
  );
}

List<BoxShadow> buildBoxShadows() {
  return [
    BoxShadow(
      offset: Offset(0, 5),
      spreadRadius: 3,
      color: Colors.black.withOpacity(.2),
      blurRadius: 10,
    ),
  ];
}

BoxDecoration buildBoxDecoration() {
  return BoxDecoration(
    borderRadius: BorderRadius.only(
      topRight: Radius.circular(30),
      bottomLeft: Radius.circular(30),
      topLeft: Radius.circular(5),
      bottomRight: Radius.circular(5),
    ),
    border: Border.all(width: 2),
  );
}
