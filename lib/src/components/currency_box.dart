import 'package:flutter/material.dart';
import 'package:money_converter/src/models/currency.dart';

class CurrencyBox extends StatelessWidget {

  final List<CurrencyModel>? items;
  final CurrencyModel selectedItem;
  final TextEditingController? controller;
  final void Function(CurrencyModel? model)? onChanged;

  const CurrencyBox({Key? key, this.items, this.controller, this.onChanged, required this.selectedItem}) : super(key: key);

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
                child: DropdownButton<CurrencyModel>(
                    isExpanded: true,
                    value: selectedItem,
                    underline: Container(height: 1, color: Colors.amber),
                    items: items?.map((item) => DropdownMenuItem(value: item, child: Text(item.name))).toList(),
                    onChanged: onChanged
                ),
              )
          ),
          const SizedBox(width: 10),
          Expanded(
              flex: 2,
              child: TextField(
                controller: controller,
                decoration: const InputDecoration(
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
