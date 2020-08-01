import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final title;

  CustomAppBar({
    @required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
  iconTheme: IconThemeData(color: Colors.black),
  backgroundColor: Color.fromRGBO(87, 200, 159, 1),
  title: Text(title,
      style: TextStyle(
        color: Colors.black,
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w900,
      )),
  actions: <Widget>[
    IconButton(
      icon: Icon(
        Icons.shopping_cart,
        color: Colors.black,
      ),
      onPressed: () {
        // Navigate to My orders page
      },
    )
  ],
);
  }

  @override
  Size get preferredSize => new Size.fromHeight(45.0);
}