import 'package:flutter/material.dart';

class BankProfileCircular extends StatelessWidget {
  const BankProfileCircular({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      height: 70,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          border: Border.all(width: 1, color: Colors.red)),
      child: const Icon(
        Icons.cancel,
        color: Colors.red,
      ),
    );
  }
}
