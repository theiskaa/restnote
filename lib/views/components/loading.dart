
import 'package:flutter/material.dart';

Widget get loading {
  return Center(
    child: CircularProgressIndicator(
      valueColor: new AlwaysStoppedAnimation<Color>(Colors.black),
    ),
  );
}