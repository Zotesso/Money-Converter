import 'package:flutter/material.dart';
import 'package:money_converter/src/components/currency_box.dart';
import 'package:money_converter/src/controllers/home_controller.dart';
import 'package:money_converter/src/models/currency.dart';

class HomeView extends StatefulWidget {
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late HomeController homeController;
  final TextEditingController toText = TextEditingController();

  final TextEditingController fromText = TextEditingController();

  @override
  void initState() {
    super.initState();
    homeController = HomeController(toText, fromText);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Padding(
          padding: const EdgeInsets.only(top: 100, left: 30, right: 30, bottom: 20),
          child: Column(
            children: [
              Image.asset('assets/logo.png', width: 150, height: 150),
              const SizedBox(height: 30),
              CurrencyBox(
                  selectedItem: homeController.toCurrency,
                  controller: toText,
                  items: homeController.currencies,
                  onChanged: (model) {
                    setState(() {
                      homeController.toCurrency = model as CurrencyModel;
                    });
                  }
              ),
              const SizedBox(height: 10),
              CurrencyBox(
                  selectedItem: homeController.fromCurrency,
                  controller: fromText,
                  items: homeController.currencies,
                  onChanged: (model) {
                    setState(() {
                      homeController.fromCurrency = model as CurrencyModel;
                    });
                  }
              ),
              const SizedBox(height: 50),
              ElevatedButton(
                  onPressed: (){
                    homeController.convert();
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.amber,
                    padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                    textStyle: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold
                    )
                  ),
                  child: const Text('Converter')
              )
            ],
          ),
        ),
      ),
    );
  }
}
