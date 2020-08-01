import 'package:flutter/material.dart';

class SideDrawerOption extends StatelessWidget {
  final int iconCode;
  final String option;
  final String navigateTo;

  SideDrawerOption({
    @required this.iconCode, 
    @required this.option, 
    @required this.navigateTo});


  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Container(
        height: 28.0,
        width: 114.0,
        margin: const EdgeInsets.only(top: 8.0, left: 16.0, bottom: 8.0),
        child: InkWell(
          child: Row(
            children: <Widget>[
              Icon(
               IconData(iconCode, fontFamily: 'MaterialIcons'),
                size: 24.0,
                color: (option == 'About Us') ? Colors.blue : Color.fromRGBO(102, 102, 102, 1),
              ),
              SizedBox(width: 16.0),
              Text(
                option,
                style: TextStyle(
                  fontSize: 16.0,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w500,
                  color: Color.fromRGBO(102, 102, 102, 1),
                ),
              ),
            ],
          ),
          onTap: () {
            // Navigate to string in navigateTo
          },
        ),
      ),
    );
  }
}
