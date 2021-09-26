import 'package:equbchallange/data/model/collected_money.dart';
import 'package:equbchallange/presentation/constants.dart';
import 'package:flutter/material.dart';

class PaymentCollectedCard extends StatelessWidget {
  final CollectedMoney data;

  const PaymentCollectedCard({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var period = "Annualy";
    if (data.frequency % 2 == 0) period = "Weekly";
    if (data.frequency % 3 == 0) period = "Monthly";

    return Container(
      width: MediaQuery.of(context).size.width / 2,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: const BorderRadius.all(Radius.circular(20.0)),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 0),
        child: SafeArea(
          child: Column(
            children: [
              Row(
                children: [
                  const CircleAvatar(
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
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Title",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        Row(
                          children: [
                            const Icon(
                              Icons.watch_later,
                              color: Colors.grey,
                              size: 15,
                            ),
                            const SizedBox(width: 5),
                            Text(
                              period,
                              style: const TextStyle(color: Colors.grey),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 8.0, 4, 0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const Icon(
                              Icons.history,
                              color: Colors.grey,
                              size: 15,
                            ),
                            const SizedBox(width: 5),
                            Text(
                              '${data.frequency.toString()} Cycles',
                              style: const TextStyle(color: Colors.grey),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            const Icon(
                              Icons.monetization_on,
                              color: Colors.grey,
                              size: 15,
                            ),
                            const SizedBox(width: 5),
                            Text(
                              'ETB ${data.amount.toString()}',
                              style: const TextStyle(color: Colors.grey),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            const Icon(
                              Icons.people,
                              color: Colors.grey,
                              size: 15,
                            ),
                            const SizedBox(width: 5),
                            Text(
                              '${data.membersCount.toString()} Memebers',
                              style: const TextStyle(color: Colors.grey),
                            ),
                          ],
                        ),
                      ],
                    ),
                    GestureDetector(
                      child: const Icon(
                        Icons.bookmark_border,
                        color: Colors.grey,
                        size: 24.0,
                      ),
                      onTap: () {
                        final snackBar = SnackBar(
                          content: Text('Bookmarked ${data.amount} payment'),
                          backgroundColor: (Colors.black87),
                          action: SnackBarAction(
                            label: 'dismiss',
                            onPressed: () {},
                          ),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
