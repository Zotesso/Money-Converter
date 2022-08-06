import 'package:flutter/material.dart';

class CurrencyBox extends StatelessWidget {
  const CurrencyBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
              flex: 1,
              child: SizedBox(
                height: 56,
                child: DropdownButton<String>(
                    isExpanded: true,
                    value: 'Real',
                    underline: Container(height: 1, color: Colors.amber),
                    items: const [
                      DropdownMenuItem(value: 'Real', child: Text('Real')),
                      DropdownMenuItem(value: 'Dolar', child: Text('Dolar')),
                      DropdownMenuItem(value: 'Euro', child: Text('Euro')),
                    ], onChanged: (value){}
                ),
              )
          ),
          const SizedBox(width: 10),
          const Expanded(
              flex: 2,
              child: TextField(
                decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.amber,
                        )
                    ),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.amber,
                        )
                    )
                ),
              )
          ),
        ],
      ),
    );
  }
}
