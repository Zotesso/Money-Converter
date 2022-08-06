
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:money_converter/src/controllers/home_controller.dart';
import 'package:money_converter/src/models/currency.dart';

main() {
  final TextEditingController toText = TextEditingController();
  final TextEditingController fromText = TextEditingController();
  final homeController = HomeController(toText, fromText);

  test('Should convert from Real to Dollar with comma instead of point', (){
    toText.text = '2,0';
    homeController.convert();
    expect(fromText.text, '0.36');
  });

  test('Should convert from Real to Dollar', (){
    toText.text = '2.0';
    homeController.convert();
    expect(fromText.text, '0.36');
  });

  test('Should convert from Dollar to Real', (){
    toText.text = '1';
    homeController.toCurrency = CurrencyModel(
        'Dolar',
        5.63,
        1.0,
        0.85,
        0.000088
    );

    homeController.fromCurrency = CurrencyModel(
        'Real',
        1.0,
        0.18,
        0.15,
        0.000016
    );

    homeController.convert();
    expect(fromText.text, '5.63');
  });
}
