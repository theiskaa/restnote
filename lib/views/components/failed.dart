import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget get failed => Container(
      color: Colors.white,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Text(
            "We can't found any note in database. Please press the refresh button or restart application. Also you can try add new note...",
            style: GoogleFonts.indieFlower(fontSize: 25),
          ),
        ),
      ),
    );
