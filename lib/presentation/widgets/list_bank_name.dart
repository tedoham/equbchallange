import 'package:flutter/material.dart';

class ListBankName extends StatelessWidget {
  Color color = Colors.red;
  String name = "Bank Name";

  ListBankName({Key? key, required this.color, required this.name})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: 10.0,
            height: 10.0,
            decoration: BoxDecoration(
              color: color,
              shape: BoxShape.circle,
            ),
          ),
        ),
        Expanded(
          child: Text(
            name,
            overflow: TextOverflow.clip,
          ),
        )
      ],
    );
  }
}
