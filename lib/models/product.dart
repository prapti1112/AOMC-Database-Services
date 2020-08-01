class Product {
  var englishName, marathiName, unit, quantity, rate, description;

  Product({this.englishName, this.marathiName, this.unit, this.rate, this.quantity});

  // static const ENGLISH_NAME = 'English Name';
  // static const MARATHI_NAME = 'Marathi Name';
  // static const RATE = 'Rate';
  // static const QUANTITY = 'Quantity';
  // static const ABOUT = 'About';
  // static const BENEFITS = 'Benefits';
  // static const STORAGE = '  Storage';
  // static const UNIT = 'Unit';

  // String _englishName, _matathiName, _about = '', _benefits = '', _storage = '', _unit;
  // num _rate, _quantity = 0;
  // Map<String, dynamic> _description;

  // // getters
  // String get englishName => _englishName;
  // String get marathiName => _matathiName;
  // num get rate => _rate;
  // num get quantity => _quantity;
  // String get unit => _unit;
  // Map<String, dynamic> get description => _description;

  // //named constructor
  //   Product.fromSnapshot(DocumentSnapshot snapshot) {
  //     Map data = snapshot.data;
  //     _englishName = data[ENGLISH_NAME];
  //     _matathiName = data[MARATHI_NAME];
  //     _rate = data[RATE];
  //     _quantity = data[QUANTITY];
  //     _about = data[ABOUT];
  //     _benefits = data[BENEFITS];
  //     _storage = data[STORAGE];
  //     _description = {'About': _about, 'Storage': _storage, 'Benefits': _benefits};
  //   }
}
