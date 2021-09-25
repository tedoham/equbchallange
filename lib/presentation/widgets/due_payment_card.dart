import 'package:equbchallange/presentation/widgets/bank_profile_circular.dart';
import 'package:flutter/material.dart';

class DuePaymentCard extends StatelessWidget {
  const DuePaymentCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(15)),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              BankProfileCircular(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Title",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ),
              Row(
                children: [
                  Icon(
                    Icons.monetization_on,
                    color: Colors.red,
                    size: 15,
                  ),
                  Text(
                    "ETB 2,000",
                    style: TextStyle(color: Colors.red),
                  ),
                ],
              ),
              Row(
                children: [
                  Icon(
                    Icons.access_time_filled,
                    color: Colors.grey[500],
                    size: 15,
                  ),
                  Text("3 Days left"),
                ],
              ),
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                  primary: Colors.red,
                  side: BorderSide(color: Colors.red, width: 1),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100)),
                ),
                onPressed: () {
                  print('Received click');
                },
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(16.0, 0, 16.0, 0),
                  child: const Text('Pay'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
