import 'package:flutter/material.dart';
import 'sideBarOption.dart';

class SideDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Container(
          color: Color.fromRGBO(223, 248, 230, 1),
// ==========Whole Drawer====================
          child: ListView(
            children: <Widget>[
// ============== Header =======================
              new UserAccountsDrawerHeader(
                accountName: Text(
                  'Sanket Bijwane',
                  style: TextStyle(color: Colors.black),
                ),
                accountEmail: Text(
                  'sanket.bijwane18@vit.edu',
                  style: TextStyle(color: Colors.black),
                ),
                currentAccountPicture: GestureDetector(
                  child: CircleAvatar(
                    backgroundColor: Colors.black,
                    child: Icon(
                      Icons.person,
                      color: Colors.white,
                      size: 55.0,
                    ),
                  ),
                ),
                decoration: BoxDecoration(
                  color: Color.fromRGBO(87, 200, 159, 1),
                ),
              ),

// ================= Drawer Options ======================
            SideDrawerOption(
              iconCode: Icons.person.codePoint, 
              option: 'My Profile', 
              navigateTo: 'Profile'),

              SideDrawerOption(
              iconCode: Icons.shopping_basket.codePoint, 
              option: 'My Order', 
              navigateTo: 'My Order'),

              SideDrawerOption(
              iconCode: Icons.feedback.codePoint, 
              option: 'Feedback', 
              navigateTo: 'Feedback'),

              SideDrawerOption(
              iconCode: Icons.help_outline.codePoint, 
              option: 'About Us', 
              navigateTo: 'About Us'),
            
              Divider(
                color: Colors.black,
                thickness: 1,
                height: 16,
              ),

              Align(
                alignment: Alignment.topLeft,
                heightFactor: 28.0,
                widthFactor: 72.0,
                child: Container(
                  margin: const EdgeInsets.only(left: 32.0, top: 16.0),
                  child: FlatButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                        side: BorderSide(
                            width: 2.0,
                            color: Color.fromRGBO(102, 102, 102, 1)),
                      ),
                      color: Color.fromRGBO(182, 229, 195, 1),
                      onPressed: () {
                        // Sign out of the app
                      },
                      child: Text('SIGN OUT', style: TextStyle(fontWeight: FontWeight.w900),)),
                ),
              )
            ],
          ),
        ),
      );
  }
}