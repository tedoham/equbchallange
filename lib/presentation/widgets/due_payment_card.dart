import 'package:equbchallange/data/model/due_payment.dart';
import 'package:equbchallange/presentation/widgets/bank_profile_circular.dart';
import 'package:flutter/material.dart';

class DuePaymentCard extends StatelessWidget {
  final DuePayment data;

  const DuePaymentCard({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: MediaQuery.of(context).size.width / 2.3,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(15)),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              const BankProfileCircular(),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  data.name,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16.0, 0, 0, 0),
                child: Row(
                  children: const [
                    Icon(
                      Icons.monetization_on,
                      color: Colors.red,
                      size: 15,
                    ),
                    SizedBox(width: 5),
                    Text(
                      "ETB 2,000",
                      style: TextStyle(color: Colors.red),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16.0, 0, 0, 0),
                child: Row(
                  children: [
                    Icon(
                      Icons.access_time_filled,
                      color: Colors.grey[500],
                      size: 15,
                    ),
                    const SizedBox(width: 5),
                    const Text("3 Days left"),
                  ],
                ),
              ),
              const SizedBox(height: 5),
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                  primary: Colors.red,
                  side: const BorderSide(color: Colors.red, width: 1),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100)),
                ),
                onPressed: () {
                  final snackBar = SnackBar(
                    content: Text('Paid ${data.paidRounds}ETB to ${data.name}'),
                    backgroundColor: (Colors.black87),
                    action: SnackBarAction(
                      label: 'dismiss',
                      onPressed: () {},
                    ),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                },
                child: const Padding(
                  padding: EdgeInsets.fromLTRB(24.0, 0, 24.0, 0),
                  child: Text('Pay'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
