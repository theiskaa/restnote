import 'package:flutter/material.dart';
import 'package:flutter_button/fabs/custom_fab.dart';

AnimatedCustomFAB buildAnimatedCustomFAB(Function onTap) {
  return AnimatedCustomFAB(
    border: Border.all(width: 2),
    child: Icon(Icons.add, color: Colors.black),
    backgroundColor: Colors.white,
    borderRadius: buildBorderRadius(),
    shadows: buildBoxShadows(),
    onTap: onTap,
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