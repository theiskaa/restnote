import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  final Widget leading;
  final String title;
  const CustomAppBar({
    Key key,
    this.leading,
    this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      shadowColor: Colors.black,
      leading: (leading != null)
          ? leading
          : Icon(Icons.backpack, color: Colors.transparent),
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(50),
          bottomRight: Radius.circular(50),
        ),
        side: BorderSide(width: 2),
      ),
      title: Text(
        title,
        style: GoogleFonts.indieFlower(color: Colors.black, fontSize: 35),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(65);
}
