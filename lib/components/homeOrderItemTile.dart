import 'package:apmc_grocery_app/models/product.dart';
import 'package:apmc_grocery_app/screens/Details/product_details.dart';
import 'package:flutter/material.dart';

class HomeOderTile extends StatefulWidget {
  String tabName;
  double qty = 0, _currentWeight = 0;
  bool _isIncreased;

  Product product;

  HomeOderTile({this.product, this.tabName});

  @override
  _HomeOderTileState createState() => _HomeOderTileState();
}

class _HomeOderTileState extends State<HomeOderTile> {
  String getCurrentWeight(double currentWeight) {
    var _additionFactor = 0.5;
    switch (widget.product.unit) {
      case 'gm':
        _additionFactor = 250;
        break;
      case 'piece':
        _additionFactor = 1;
        break;
      case 'dozen':
        _additionFactor = 0.5;
    }
    if (!widget._isIncreased) {
      _additionFactor = (-1) * _additionFactor;
    }
    setState(() {
      widget._currentWeight = currentWeight + _additionFactor;
    });
    return (widget._currentWeight.toString() + ' ' + widget.product.unit);
  }

  @override
  Widget build(BuildContext context) {
    String displayUnit;
    switch (widget.product.unit) {
      case 'gm':
        displayUnit = '250 gm';
        break;
      case 'piece':
        displayUnit = '1 piece';
        break;
      case 'dozen':
        displayUnit = widget.product.unit;
        break;
      default:
        displayUnit = 'none';
    }
    // return Container(
    //   height: 100.0,
    //   margin: const EdgeInsets.all(16.0),
    //   decoration: BoxDecoration(
    //     borderRadius: BorderRadius.circular(10.0),
    //     color: Color(0xFFEEEEEE), //Colors.teal,
    //   ),
    //   child: Center(
    //     child: ListTile(
    //       contentPadding: const EdgeInsets.symmetric(horizontal: 8.0),
    //       leading: Container(
    //         // height: 120.0,
    //         color: Colors.redAccent,
    //         child: ClipRRect(
    //           borderRadius: BorderRadius.circular(5.0),
    //           child: Image.asset(
    //             'assets/lady_finger.jpg',
    //             // fit: BoxFit.fill,
    //           ),
    //         ),
    //         width: 65.0,
    //       ),
    //       title: Container(
    //         color: Colors.deepOrangeAccent,
    //         height: 20.0,
    //       ),
    //       subtitle: Container(
    //         color: Colors.deepPurple,
    //         height: 20.0,
    //       ),
    //       trailing: Container(
    //         width: 100.0,
    //         child: Column(
    //           children: <Widget>[
    //             Container(
    //               margin: const EdgeInsets.only(bottom: 8.0),
    //               child: Text(
    //                 '₹ 40.00',
    //                 style: TextStyle(
    //                   fontFamily: 'Roboto',
    //                   fontSize: 14.0,
    //                   color: Color(0xFF666363),
    //                 ),
    //               ),
    //             ),
    //             Container(
    //               height: 28.0,
    //               // margin: EdgeInsets.only(bottom: 0.0),
    //               // color: Colors.purple,
    //               child: FlatButton(
    //                 color: Colors.red,
    //                 onPressed: () {
    //                   print('Added to cart');
    //                 },
    //                 child: Text(
    //                   'ADD TO CART',
    //                   style: TextStyle(
    //                     fontSize: 10.5,
    //                     fontFamily: 'Roboto',
    //                   ),
    //                 ),
    //               ),
    //             ),
    //           ],
    //         ),
    //       ),
    //     ),
    //   ),
    // );

    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Details(
              name: widget.product.englishName,
              rate: widget.product.rate,
              qty: widget.qty,
              unit: displayUnit,
              tabName: widget.tabName,
            ),
          ),
        );
      },
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      child: Card(
        margin: EdgeInsets.symmetric(vertical: 6.0, horizontal: 6.0),
        color: Color(0xFFF3F3F3),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2.0),
            child: Row(
              children: <Widget>[
                Container(
                  height: 70.0,
                  width: 65.0,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: ExactAssetImage('assets/lady_finger.jpg'),
                        fit: BoxFit.fill),
                    border: Border.all(width: 1.5),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),

                SizedBox(
                  width: 4.0,
                ),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      constraints: BoxConstraints(maxWidth: 85, minWidth: 75),
                      child: Text(
                        widget.product.englishName,
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 14,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    SizedBox(height: 8.0),
                    Text(
                      "₹ ${widget.product.rate}",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Roboto',
                        color: Color(0xFF686868),
                      ),
                    ),
                    Text(
                      "per " + displayUnit,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Roboto',
                        color: Color(0xFF686868),
                      ),
                    ),
                  ],
                ),

                // SizedBox(width: 10.0),

                //-------------------------------------------------------------------------------------------------------
                Container(
                  margin: EdgeInsets.only(right: 4.0, left: 4.0),
                  constraints: BoxConstraints(minWidth: 70),
                  // color: Colors.amber,
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: 20.0),
                      Text(
                        (widget.qty > 0)
                            ? getCurrentWeight(widget._currentWeight)
                            : '',
                        style: TextStyle(
                          fontSize: 13.5,
                          color: Color(0xFF8B8B8B),
                        ),
                      ),
                      Container(
                        height: 60.0,
                        width: 80.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Row(
                          children: <Widget>[
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                    width: 2.0, color: Color(0xFF5C5C5C)),
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
                                  size: 18.0,
                                ),
                              ),
                            ),
                            SizedBox(width: 2.0),
                            Container(
                              height: 21,
                              width: 25,
                              decoration: BoxDecoration(
                                border: Border.all(width: 1.5),
                                borderRadius: BorderRadius.circular(5.0),
                                color: Colors.white,
                              ),
                              child: Text(
                                (widget.qty > 0) ? widget.qty.toString() : '',
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 15.0),
                              ),
                            ),
                            SizedBox(width: 2.0),
                            Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                    width: 2.0, color: Color(0xFF5C5C5C)),
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              child: InkWell(
                                onTap: () {
                                  widget._isIncreased = true;
                                  setState(() {
                                    widget.qty = widget.qty + 1;
                                  });
                                },
                                child: Icon(Icons.add,
                                    color: Colors.black, size: 18),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                Container(
                  width: 90.0,
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(top: 18.0),
                        child: Text(
                          (widget.qty > 0)
                              ? '₹' +
                                  (widget.product.rate * widget.qty).toString()
                              : '',
                          style:
                              TextStyle(fontSize: 16, color: Color(0xFF494747)),
                        ),
                      ),
                      SizedBox(
                        height: 4.0,
                      ),
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
                        child: Text(
                          'ADD TO CART',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 13.0,
                            fontFamily: 'Roboto',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );

    // return Container(
    //   width: MediaQuery.of(context).size.width,
    //   height: MediaQuery.of(context).size.height / 7,
    //   decoration: BoxDecoration(
    //     borderRadius: BorderRadius.circular(8.0),
    //     color: Color(0xFFF3F3F3),
    //   ),
    //   padding: EdgeInsets.all(6.0),
    //   margin: EdgeInsets.symmetric(vertical: 10, horizontal: 8.0),
    //   child: Row(
    //     children: <Widget>[
    //       Container(
    //         // photo container
    //         height: double.infinity,
    //         width: MediaQuery.of(context).size.width / 5,
    //         // color: Colors.cyan,
    //         decoration: BoxDecoration(
    //           image: DecorationImage(
    //               image: ExactAssetImage('assets/lady_finger.jpg'),
    //               fit: BoxFit.fill),
    //           border: Border.all(width: 1.5),
    //           borderRadius: BorderRadius.circular(10.0),
    //         ),
    //       ),
    //       Container(
    //         //name and rate container
    //         margin: EdgeInsets.only(left: 4.0, right: 2.0),
    //         height: double.infinity,
    //         width: MediaQuery.of(context).size.width / 3.75,
    //         // color: Colors.brown,
    //         child: Column(
    //           crossAxisAlignment: CrossAxisAlignment.start,
    //           children: <Widget>[
    //             Container(
    //               margin: EdgeInsets.symmetric(vertical: 2.0),
    //               // color: Colors.deepOrange,
    //               height: MediaQuery.of(context).size.height / 20,
    //               child: Text(
    //                 'Cauliflower',
    //                 style:
    //                     TextStyle(fontWeight: FontWeight.bold, fontSize: 18.5),
    //               ),
    //             ),
    //             Container(
    //               margin: EdgeInsets.only(top: 2.0),
    //               // color: Colors.deepPurple,
    //               height: MediaQuery.of(context).size.height / 40,
    //               width: 20,
    //               child: Text('16'),
    //             ),
    //             Container(
    //               margin: EdgeInsets.only(top: 2.0),
    //               // color: Colors.green,
    //               height: MediaQuery.of(context).size.height / 37,
    //               child: Text('per 250 gm'),
    //             ),
    //           ],
    //         ),
    //       ),
    //       Container(
    //         // qty add container
    //         height: double.infinity,
    //         width: MediaQuery.of(context).size.width / 4.9,
    //         margin: EdgeInsets.only(right: 4.0),
    //         // color: Colors.grey,
    //         child: Column(
    //           children: <Widget>[
    //             Container(
    //               child: Text('1000 gm'),
    //               margin: EdgeInsets.symmetric(vertical: 12.0),
    //             ),
    //             Container(
    //               // color: Colors.indigo,
    //               margin: EdgeInsets.only(top: 1.0),
    //               child: Row(
    //                 children: <Widget>[
    //                   Container(
    //                     decoration: BoxDecoration(
    //                       borderRadius: BorderRadius.circular(10.0),
    //                     ),
    //                   ),
    //                   Container(
    //                     decoration: BoxDecoration(
    //                       border:
    //                           Border.all(width: 2.0, color: Color(0xFF5C5C5C)),
    //                       borderRadius: BorderRadius.circular(20.0),
    //                     ),
    //                     child: InkWell(
    //                       onTap: () {},
    //                       child: Icon(
    //                         Icons.remove,
    //                         color: Colors.black,
    //                         size: 18.0,
    //                       ),
    //                     ),
    //                   ),
    //                   SizedBox(width: 2.0),
    //                   Container(
    //                     height: 21,
    //                     width: 25,
    //                     decoration: BoxDecoration(
    //                       border: Border.all(width: 1.5),
    //                       borderRadius: BorderRadius.circular(5.0),
    //                       color: Colors.white,
    //                     ),
    //                     child: Center(child: Text('4')),
    //                   ),
    //                   SizedBox(width: 2.0),
    //                   Container(
    //                     decoration: BoxDecoration(
    //                       border:
    //                           Border.all(width: 2.0, color: Color(0xFF5C5C5C)),
    //                       borderRadius: BorderRadius.circular(20.0),
    //                     ),
    //                     child: InkWell(
    //                       onTap: () {},
    //                       child: Icon(Icons.add, color: Colors.black, size: 18),
    //                     ),
    //                   ),
    //                 ],
    //               ),
    //             ),
    //           ],
    //         ),
    //       ),
    //       Container(
    //         // final prices and add to cart container
    //         height: double.infinity,
    //         alignment: Alignment.centerRight,
    //         width: MediaQuery.of(context).size.width / 4.5,
    //         // color: Colors.red,
    //         child: Column(
    //           children: <Widget>[
    //             SizedBox(
    //               height: 5.0,
    //             ),
    //             Container(
    //               height: MediaQuery.of(context).size.width / 20,
    //               child: Text('200'),
    //             ),
    //             FlatButton(
    //               shape: RoundedRectangleBorder(
    //                 borderRadius: BorderRadius.circular(10.0),
    //                 side: BorderSide(
    //                   width: 1.5,
    //                   color: Color(0xFF57C89F),
    //                 ),
    //               ),
    //               color: Colors.white,
    //               splashColor: Color.fromRGBO(87, 200, 159, 1),
    //               onPressed: () {},
    //               child: Text(
    //                 'ADD TO CART',
    //                 textAlign: TextAlign.center,
    //                 style: TextStyle(
    //                   fontSize: 13.0,
    //                   fontFamily: 'Roboto',
    //                 ),
    //               ),
    //             ),
    //           ],
    //         ),
    //       ),
    //     ],
    //   ),
    // );
  }
}
