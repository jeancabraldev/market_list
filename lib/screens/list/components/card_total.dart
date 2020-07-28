import 'package:flutter/material.dart';

class CardTotalWidget extends StatelessWidget {
  CardTotalWidget({this.subTotal, this.total});

  final double subTotal;
  final double total;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 2, vertical: 2),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text(
              'Subtotal',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              'R\$ ${subTotal.toString()}',
              style: const TextStyle(fontSize: 14),
            ),
            const SizedBox(height: 5),
            const Text(
              'Total',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              'R\$ ${total.toString()}',
              style: const TextStyle(fontSize: 19),
            ),
          ],
        ),
      ),
    );

  }
}
