import 'package:apmc_grocery_app/components/customAppBar.dart';
import 'package:apmc_grocery_app/components/sideDrawer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class Details extends StatefulWidget {
  var name,
      rate,
      unit,
      tabName,
      prod_description = {
    'About': 'no description',
    'Storage': 'no storage advice',
    'Benefits': 'no benefits added'
  };
  num qty;
  bool _isIncreased = false;

  Details({this.name, this.qty, this.rate, this.unit, this.tabName});

  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  bool _isFavourite = false;

  Future getProductDescription() async {
    await Firestore.instance
        .collection(widget.tabName)
        .document(widget.name)
        .get()
        .then((value) => {
              Timer(const Duration(milliseconds: 500), () {
                setState(() {
                  widget.prod_description = {
                    'About': value.data['About'],
                    'Storage': value.data['Storage'],
                    'Benefits': value.data['Benefits']
                  };
                });
              }),
            });
  }

  @override
  Widget build(BuildContext context) {
    getProductDescription();
    return Scaffold(
      appBar: CustomAppBar(title: 'Details'),
      drawer: SideDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Center(
              child: Container(
                margin: EdgeInsets.only(top: 32, bottom: 16.0),
                height: 180.0,
                width: 200.0,
                alignment: Alignment.bottomRight,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: ExactAssetImage('assets/lady_finger.jpg'),
                      fit: BoxFit.fill),
                  border: Border.all(width: 0.8),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: IconButton(
                  icon: (_isFavourite)
                      ? Icon(
                          Icons.favorite,
                          color: Colors.redAccent,
                          size: 32.0,
                        )
                      : Icon(
                          Icons.favorite_border,
                          size: 30.0,
                        ),
                  onPressed: () {
                    setState(() {
                      _isFavourite = !(_isFavourite);
                    });
                  },
                ),
              ),
            ),
            Stack(
              children: <Widget>[
                Positioned(
                  child: Container(
                    alignment: Alignment.centerLeft,
                    // color: Colors.amber,
                    margin: EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(
                      widget.name,
                      style: TextStyle(
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.bold,
                          fontSize: 24.0),
                      textAlign: TextAlign.start,
                    ),
                  ),
                ),
                Positioned(
                  right: 0.0,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 16.0, top: 4.0),
                    child: Text(
                      widget.rate.toString() + ' per ' + widget.unit,
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w600,
                        fontSize: 16.0,
                        color: Colors.red,
                      ),
                      textAlign: TextAlign.right,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding:
                  const EdgeInsets.only(left: 16.0, top: 20.0, bottom: 8.0),
              child: Row(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(width: 2.0, color: Color(0xFF5C5C5C)),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: InkWell(
                      onTap: () {
                        widget._isIncreased = false;
                        setState(() {
                          widget.qty = widget.qty - 1;
                        });
                      },
                      child: Icon(
                        Icons.remove,
                        color: Colors.black,
                        size: 20.0,
                      ),
                    ),
                  ),
                  SizedBox(width: 4.0),
                  Container(
                    height: 24,
                    width: 32,
                    decoration: BoxDecoration(
                      border: Border.all(width: 1.5),
                      borderRadius: BorderRadius.circular(5.0),
                      color: Colors.white,
                    ),
                    child: Text(
                      (widget.qty > 0) ? widget.qty.toString() : '',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 18.0),
                    ),
                  ),
                  SizedBox(width: 4.0),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(width: 2.0, color: Color(0xFF5C5C5C)),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: InkWell(
                      onTap: () {
                        widget._isIncreased = true;
                        setState(() {
                          widget.qty = widget.qty + 1;
                        });
                      },
                      child: Icon(Icons.add, color: Colors.black, size: 20),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 16.0),
              child: Column(children: [
                SizedBox(
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(
                      'About the product',
                      style: TextStyle(
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w600,
                          fontSize: 18.0),
                    ),
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(
                      widget.prod_description['About'],
                      style: TextStyle(
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w400,
                          fontSize: 14.0),
                    ),
                  ),
                ),
              ]),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 16.0),
              child: Column(children: [
                SizedBox(
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(
                      'Storage and Usages',
                      style: TextStyle(
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w600,
                          fontSize: 18.0),
                    ),
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(
                      widget.prod_description['Storage'],
                      style: TextStyle(
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w400,
                          fontSize: 14.0),
                    ),
                  ),
                ),
              ]),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 16.0),
              child: Column(children: [
                SizedBox(
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(
                      'Benefits',
                      style: TextStyle(
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w600,
                          fontSize: 18.0),
                    ),
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(
                      widget.prod_description['Benefits'],
                      style: TextStyle(
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w400,
                          fontSize: 14.0),
                    ),
                  ),
                ),

                SizedBox(height: 30.0,),

                FlatButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    side: BorderSide(
                      width: 2.0,
                      color: Color(0xFF57C89F),
                    ),
                  ),
                  color: Colors.white,
                  splashColor: Color.fromRGBO(87, 200, 159, 1),
                  onPressed: () {},
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: Text(
                      'ADD TO CART',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16.0,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 80.0,),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
