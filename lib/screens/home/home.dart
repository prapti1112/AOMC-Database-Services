import 'package:apmc_grocery_app/models/product.dart';
import 'package:apmc_grocery_app/services/database_services.dart';
import 'package:flutter/material.dart';
import '../../components/customAppBar.dart';
import '../../components/sideDrawer.dart';
import '../../components/homeOrderItemTile.dart';
import '../../components/customBottomNavigationBar.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String query;
  List<Product> filteredProducts = List(),
      vegetableProds = List(),
      fruitProds = List();
  TextEditingController searchController = TextEditingController();

  generateListView(String tName) {
    DatabaseServices(categoryName: tName)
        .getInventoryData()
        .then((List<Product> prods) {
      setState(() {
        if (tName == 'Vegetables') {
          vegetableProds = prods;
        } else if (tName == 'Fruits') {
          fruitProds = prods;
        }
      });
    });
  }

  @override
  void initState() {
    setState(() {
      generateListView('Vegetables');
      generateListView('Fruits');
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print('In home build');
    // if (vegetableProds.length == 0) {
    //   generateListView('Vegetables');
    //   generateListView('Fruits');
    // }

    print('Vegetable list ' +
        vegetableProds.toString() +
        ' Length: ' +
        vegetableProds.length.toString());
    print('Fruit list ' +
        fruitProds.toString() +
        ' Length: ' +
        fruitProds.length.toString());
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
                      // for (var item in filteredProducts) {
                      //   if (item.englishName
                      //       .toString()
                      //       .toLowerCase()
                      //       .contains(searchController.text.toLowerCase())) {
                      //     filteredProducts.add(item);
                      //   }
                      // }
                      // setState(() {
                      //   filteredProducts = filteredProducts.where((item) => item
                      //       .englishName
                      //       .toString()
                      //       .toLowerCase()
                      //       .contains(searchController.text.toLowerCase())).toList();
                      // });
                      // ListView.builder(itemBuilder: (BuildContext context, int index) {
                      //   return HomeOderTile(
                      //           product: filteredProducts[index],
                      //         );
                      // });
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
                    onPressed: () {},
                  ),
                ),
              ],
            ),

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

            Expanded(
              child: Container(
                child: TabBarView(
                  children: <Widget>[
                    Container(
                      child: ListView.builder(
                          itemCount: vegetableProds.length,
                          itemBuilder: (BuildContext context, int index) {
                            print(index);
                            if (index == 0) {
                              filteredProducts = vegetableProds;
                            }
                            if (filteredProducts == null) {
                              return Center(
                                child: Text('Loading.....'),
                              );
                            } else {
                              return HomeOderTile(
                                product: filteredProducts[index],
                                tabName: 'Vegetables',
                              );
                            }
                          }),
                    ),
                    Container(
                      child: ListView.builder(
                        itemCount: fruitProds.length,
                        itemBuilder: (BuildContext context, int index) {
                          print(index);
                          if (index == 0) {
                            filteredProducts = fruitProds;
                          }
                          if (filteredProducts == null) {
                            return Center(
                              child: Text('Loading.....'),
                            );
                          } else {
                            return HomeOderTile(
                              product: filteredProducts[index],
                              tabName: 'Fruits',
                            );
                          }
                        },
                      ),
                    ),
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
