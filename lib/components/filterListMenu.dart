import 'package:flutter/material.dart';

class FilterListMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: DropdownButton(
        icon: Icon(
          Icons.filter_list,
        ),
        items: <DropdownMenuItem<dynamic>>[],
        onChanged: (value) {},
      ),
    );
  }
}
