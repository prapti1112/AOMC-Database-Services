import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final String page_name;

  CustomBottomNavigationBar({
    @required this.page_name,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFF57C89F),
      height: 36.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          IconButton(
            icon: Icon(
              Icons.favorite,
              color: (page_name.toLowerCase() == 'favourites')
                  ? Colors.black
                  : Colors.white,
            ),
            onPressed: () {
              print('Going to favourites');
              // Navigate to favourites page
            },
          ),
          IconButton(
            icon: Icon(Icons.home,
            color: (page_name.toLowerCase() == 'home')
                  ? Colors.black
                  : Colors.white,),
            onPressed: () {
              print('Going to Home Page');
              // Navigate to  Home page
            },
          ),
          IconButton(
            icon: Icon(Icons.shopping_basket,
            color: (page_name.toLowerCase() == 'my orders')
                  ? Colors.black
                  : Colors.white,),
            onPressed: () {
              print('Going to My Orders');
              // Navigate to My Orders page
            },
          ),
        ],
      ),
    );
  }
}
