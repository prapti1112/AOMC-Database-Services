import 'package:flutter/material.dart';
import 'screens/home/home.dart';

void main() {
  var materialApp = MaterialApp(
      title: 'Kadam FarmTech',
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  runApp(
    materialApp,
  );
}

