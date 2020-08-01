import 'package:apmc_grocery_app/models/product.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class DatabaseServices {
  String categoryName;
  List<Product> inventory = [];

  DatabaseServices({@required this.categoryName});

  Future<List<Product>> getInventoryData() async {
    await Firestore.instance.collection(categoryName).getDocuments().then((QuerySnapshot snapshot) {
      snapshot.documents.forEach((element) {
        inventory.add(Product(
          englishName: element.data['English Name'],
          marathiName: element.data['Marathi Name'],
          unit: (categoryName == 'Vegetables') ? 'gm' : element.data['Unit'],
          rate: element.data['Rate'],
        ));
      });
    });
    return inventory;
  }

}
