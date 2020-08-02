import 'package:apmc_grocery_app/models/product.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class DatabaseServices {
  String categoryName;
  List<Product> inventory = [];

  DatabaseServices({@required this.categoryName});

  Future<List<Product>> getInventoryData() async {
    print('Inside getInventory Data');
    await Firestore.instance
        .collection(categoryName)
        .getDocuments()
        .then((QuerySnapshot snapshot) {
      snapshot.documents.forEach((item) {
        inventory.add(Product(
            englishName: item.data['English Name'],
            marathiName: item.data['Marathi Name'],
            unit: (categoryName == 'Vegetables') ? 'gm' : item.data['Unit'],
            rate: item.data['Rate']));
      });
    });
    return inventory;
  }
}
