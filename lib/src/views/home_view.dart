import 'package:flutter/material.dart';
import 'package:money_converter/src/components/currency_box.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

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
              const CurrencyBox(),
              const SizedBox(height: 10),
              const CurrencyBox(),
              const SizedBox(height: 50),
              ElevatedButton(
                  onPressed: (){},
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
