import 'package:flutter/material.dart';

class PaymentButton extends StatelessWidget {
  String name = "Bank Name";
  bool active = false;

  PaymentButton({Key? key, required this.name, required this.active})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ButtonStyle flatButtonStyle = TextButton.styleFrom(
      primary: active == true ? Colors.white : Colors.grey,
      minimumSize: Size(88, 36),
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      side: BorderSide(
        color: active == true ? Colors.transparent : Colors.grey,
        width: 1,
      ),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(100.0)),
      ),
      backgroundColor: active == true ? Colors.green : Colors.white,
      elevation: active == true ? 5 : 0,
    );

    return TextButton(
      style: flatButtonStyle,
      onPressed: () {},
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Text(name),
      ),
    );
  }
}
