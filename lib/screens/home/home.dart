import 'dart:async';

import 'package:apmc_grocery_app/components/homeOrderItemTile.dart';
import 'package:apmc_grocery_app/models/product.dart';
import 'package:apmc_grocery_app/services/database_services.dart';
import 'package:flutter/material.dart';
import '../../components/customAppBar.dart';
import '../../components/sideDrawer.dart';
import '../../components/customBottomNavigationBar.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String query;
  TextEditingController searchController = TextEditingController();
  List<Product> products, vegetableProducts, fruitProducts;

  @override
  void initState() {
    // DatabaseServices(categoryName: 'Vegetables').getInventoryData();
    print('Before call');
        DatabaseServices(categoryName: 'Vegetables').getInventoryData().then((value) {
          setState(() {
            vegetableProducts = value;
          });
        });
        DatabaseServices(categoryName: 'Fruits').getInventoryData().then((value) {
          setState(() {
            fruitProducts = value;
          });
        });
    print('After call');
    Timer(Duration(seconds: 3), () {
      print('Vegetables:  $vegetableProducts');
      print('Fruits:  $fruitProducts');
    });

    super.initState();
  }

  generateListView(BuildContext context, String listName) {
    return ListView.builder(itemBuilder: (BuildContext context, int index) {
      return HomeOderTile();
    });
  }

  @override
  Widget build(BuildContext context) {
    print('In home build');
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: CustomAppBar(title: 'Home'),
        drawer: SideDrawer(),

// ============== Body ======================
        body: Column(
          children: <Widget>[
// ........................ Search and filter row ............................
            Row(
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.only(
                      left: 16.0, top: 16.0, right: 8.0, bottom: 16.0),
                  height: 30.0,
                  width: 220.0,
                  color: Color(0xFFEBEBEB),
                  child: TextField(
                    controller: searchController,
                    decoration: InputDecoration(
                      hintText: 'Search',
                      contentPadding: EdgeInsets.all(4.0),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16.0),
                        borderSide: BorderSide(
                          color: Color(0xFFEBEBEB),
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 28.0,
                  width: 28.0,
                  color: Color(0xFFEBEBEB),
                  margin:
                      const EdgeInsets.only(top: 16.0, left: 8.0, bottom: 16.0),
                  child: IconButton(
                    padding: const EdgeInsets.only(),
                    icon: Icon(
                      Icons.search,
                      size: 28.0,
                    ),
                    onPressed: () {
                      // give suggestions for the typed item
                      print('Search pressed');
                    },
                  ),
                ),
                Container(
                  height: 28.0,
                  width: 28.0,
                  margin: const EdgeInsets.only(top: 16.0, left: 32.0),
                  child: IconButton(
                    padding: const EdgeInsets.only(),
                    icon: Icon(
                      Icons.filter_list,
                      size: 28.0,
                    ),
                    onPressed: () {
                      print('Filter pressed');
                    },
                  ),
                ),
              ],
            ),

// ........................ Tab Bar row .................................
            TabBar(
              labelColor: Colors.black,
              indicatorColor: Color(0xFFFFBE5C),
              indicatorWeight: 2.8,
              labelStyle: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w900,
                  fontSize: 17.0),
              unselectedLabelStyle: TextStyle(
                  color: Color(0xFF717171),
                  fontWeight: FontWeight.w600,
                  fontSize: 14.0),
              tabs: <Widget>[
                Tab(
                  text: 'Vegetables',
                ),
                Tab(
                  text: 'Fruits',
                ),
                Tab(
                  text: 'Others',
                ),
              ],
            ),

// ........................ Tab Bar body ...............................
            Expanded(
              child: Container(
                child: TabBarView(
                  children: <Widget>[
                    Center(child: Text('Vegetables')),
                    Center(child: Text('Fruits')),
                    Center(child: Text('Others')),
                  ],
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar: CustomBottomNavigationBar(
          page_name: 'Home',
        ),
      ),
    );
  }
}
