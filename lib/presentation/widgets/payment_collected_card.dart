import 'package:equbchallange/presentation/constants.dart';
import 'package:equbchallange/presentation/widgets/bank_profile_circular.dart';
import 'package:flutter/material.dart';

class PaymentCollectedCard extends StatelessWidget {
  const PaymentCollectedCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color color = Colors.grey;
    String name = "Bank Name";

    return Container(
      width: MediaQuery.of(context).size.width / 2,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.all(Radius.circular(20.0)),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 0),
        child: SafeArea(
          child: Column(
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: kGreenColor,
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 28,
                      child: Icon(
                        Icons.savings,
                        color: kGreenColor,
                        size: 42,
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      Text(
                        "Title",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.monetization_on,
                            color: Colors.grey,
                            size: 15,
                          ),
                          Text(
                            "ETB 2,000",
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.monetization_on,
                            color: Colors.grey,
                            size: 15,
                          ),
                          Text(
                            "ETB 2,000",
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.monetization_on,
                            color: Colors.grey,
                            size: 15,
                          ),
                          Text(
                            "ETB 2,000",
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.monetization_on,
                            color: Colors.grey,
                            size: 15,
                          ),
                          Text(
                            "ETB 2,000",
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Icon(
                    Icons.bookmark_border,
                    color: Colors.grey,
                    size: 24.0,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
