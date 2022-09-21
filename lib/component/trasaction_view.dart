import 'package:flutter/material.dart';

import '../model/transaction_model.dart';

class TransactionView extends StatelessWidget {
  const TransactionView({Key? key, required this.transactionModel}) : super(key: key);
  final TransactionModel transactionModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15), color: Colors.white),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                transactionModel.type=="-"?
               const Icon(
                  Icons.arrow_downward,
                  color: Colors.red,
                  size: 28,
                ):
             const    Icon(
                  Icons.arrow_upward,
                  color: Colors.green,
                  size: 28,
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  transactionModel.name,
                  style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
            Row(
              children: [
                Text(
                  transactionModel.type+transactionModel.price.toString(),
                  style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  transactionModel.currency,
                  style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 12,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
