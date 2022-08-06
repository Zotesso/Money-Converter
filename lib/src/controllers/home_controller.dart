import 'package:flutter/material.dart';
import 'package:money_converter/src/models/currency.dart';

class HomeController {
  late List<CurrencyModel> currencies;

  final TextEditingController toTextValue;
  final TextEditingController fromTextValue;

  late CurrencyModel toCurrency;
  late CurrencyModel fromCurrency;

  HomeController(this.toTextValue, this.fromTextValue) {
    currencies = CurrencyModel.getCurrencies();
    toCurrency = currencies[0];
    fromCurrency = currencies[1];
  }

  void convert() {
    double toValue = double.tryParse(toTextValue.text.replaceAll(',', '.')) ?? 1.0;
    double convertedValue = 0;

    if (fromCurrency.name == 'Real') {
      convertedValue = toValue * toCurrency.real;
    } else if (fromCurrency.name == 'Dolar') {
      convertedValue = toValue * toCurrency.dolar;
    } else if (fromCurrency.name == 'Euro') {
      convertedValue = toValue * toCurrency.euro;
    } else if (fromCurrency.name == 'Bitcoin') {
      convertedValue = toValue * toCurrency.bitcoin;
    }

    fromTextValue.text = convertedValue.toStringAsFixed(2);
  }
}