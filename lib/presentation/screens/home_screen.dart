import 'package:equbchallange/presentation/constants.dart';
import 'package:equbchallange/presentation/widgets/due_payment_card.dart';
import 'package:equbchallange/presentation/widgets/list_bank_name.dart';
import 'package:equbchallange/presentation/widgets/bank_chart_info.dart';
import 'package:equbchallange/presentation/widgets/payment_button.dart';
import 'package:equbchallange/presentation/widgets/payment_collected_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            SizedBox(height: 70),
            Container(
              // height: 160,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(32.0, 0, 32.0, 0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CircleAvatar(
                      backgroundColor: kProfileColor,
                    ),
                    const Icon(
                      Icons.bookmark_border,
                      color: Colors.grey,
                      size: 24.0,
                    ),
                  ],
                ),
              ),
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(24.0, 32, 32.0, 0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 250,
                      child: RichText(
                        maxLines: 14,
                        textAlign: TextAlign.start,
                        overflow: TextOverflow.clip,
                        softWrap: true,
                        text: TextSpan(
                          text: 'Hi, ',
                          style: TextStyle(color: Colors.black54, fontSize: 18),
                          children: const <TextSpan>[
                            TextSpan(
                                text: 'Alem',
                                style: TextStyle(
                                    decoration: TextDecoration.underline)),
                            TextSpan(text: ' have'),
                            TextSpan(
                                text: ' ETB 40,000',
                                style: TextStyle(color: kGreenColor)),
                            TextSpan(text: ' unpaid debt.'),
                          ],
                        ),
                      ),
                    ),
                    Icon(
                      Icons.arrow_drop_up,
                      color: kProfileColor,
                      size: 28.0,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 70),
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 0, 8, 0),
              child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 4,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ListBankName(
                              color: Colors.green,
                              name: "Commercial bank of ethiopia"),
                          ListBankName(color: Colors.yellow, name: "Awash"),
                          ListBankName(color: Colors.blue, name: "Oromia"),
                          ListBankName(color: Colors.blue, name: "Oromia"),
                          ListBankName(color: Colors.blue, name: "Oromia"),
                          ListBankName(color: Colors.blue, name: "Oromia"),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 7,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                        child: BankChartInfo(),
                      ),
                      // child: Text("something here.... sjfhjsdhf dfdf "),
                    )
                  ]),
            ),
            SizedBox(height: 70),
            Text(
              "Due Payments",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
            ),
            SizedBox(height: 5),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    DuePaymentCard(),
                    DuePaymentCard(),
                    DuePaymentCard(),
                    DuePaymentCard(),
                    DuePaymentCard(),
                    DuePaymentCard(),
                    DuePaymentCard(),
                  ],
                ),
              ),
            ),
            // SizedBox(height: 50),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                PaymentButton(
                  name: 'Money Collected',
                  active: true,
                ),
                PaymentButton(
                  name: 'Money Due',
                  active: false,
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                height: 600,
                child: GridView.count(
                  scrollDirection: Axis.vertical,
                  crossAxisCount: 2,
                  crossAxisSpacing: 10.0,
                  mainAxisSpacing: 10.0,
                  children: <Widget>[
                    PaymentCollectedCard(),
                    PaymentCollectedCard(),
                    PaymentCollectedCard(),
                    PaymentCollectedCard(),
                    PaymentCollectedCard(),
                    PaymentCollectedCard(),
                  ],
                ),
              ),
            ),
            // Column(
            //   children: [
            //     Padding(
            //       padding: const EdgeInsets.all(8.0),
            //       child: Row(
            //         crossAxisAlignment: CrossAxisAlignment.center,
            //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //         children: [
            //           Expanded(
            //             child: PaymentCollectedCard(),
            //           ),
            //           Expanded(
            //             child: PaymentCollectedCard(),
            //           ),
            //         ],
            //       ),
            //     ),
            //   ],
            // ),
            // PaymentCollectedCard()
            // CustomScrollView(
            //   primary: false,
            //   slivers: <Widget>[
            //     SliverPadding(
            //       padding: const EdgeInsets.all(20),
            //       sliver: SliverGrid.count(
            //         crossAxisSpacing: 10,
            //         mainAxisSpacing: 10,
            //         crossAxisCount: 2,
            //         children: <Widget>[
            //           Container(
            //             padding: const EdgeInsets.all(8),
            //             child: const Text("He'd have you all unravel at the"),
            //             color: Colors.green[100],
            //           ),
            //         ],
            //       ),
            //     ),
            //   ],
            // ),
          ],
        ),
      ),
    );
  }
}
