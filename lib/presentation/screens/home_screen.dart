import 'package:equbchallange/presentation/constants.dart';
import 'package:equbchallange/presentation/widgets/due_payment_card.dart';
import 'package:equbchallange/presentation/widgets/list_bank_name.dart';
import 'package:equbchallange/presentation/widgets/bank_chart_info.dart';
import 'package:equbchallange/presentation/widgets/payment_button.dart';
import 'package:equbchallange/presentation/widgets/payment_collected_card.dart';
import 'package:equbchallange/provider/page_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _isVisible = true;

  void showChart() {
    setState(() {
      _isVisible = !_isVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ChangeNotifierProvider<PageProvider>(
        create: (context) => PageProvider(),
        child: Consumer<PageProvider>(
          builder: (context, provider, child) {
            if (provider.duePayments.isEmpty ||
                provider.collectedMoney.isEmpty) {
              provider.fetchDuePayments();
              provider.fetchCollectedMoney();
            }
            return SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 70),
                  topHeader(),
                  lowerHeader(),
                  Visibility(
                    visible: _isVisible,
                    child: Column(
                      children: [
                        const SizedBox(height: 70),
                        chartView(),
                      ],
                    ),
                  ),
                  const SizedBox(height: 70),
                  const Padding(
                    padding: EdgeInsets.fromLTRB(20.0, 0, 0, 0),
                    child: Text(
                      "Due Payments",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                    ),
                  ),
                  const SizedBox(height: 5),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: provider.duePayments
                            .map((data) => DuePaymentCard(data: data))
                            .toList(),
                      ),
                    ),
                  ),
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
                    child: SizedBox(
                      height: 600,
                      child: GridView.count(
                        scrollDirection: Axis.vertical,
                        crossAxisCount: 2,
                        crossAxisSpacing: 10.0,
                        mainAxisSpacing: 10.0,
                        children: provider.collectedMoney
                            .map((data) => PaymentCollectedCard(data: data))
                            .toList(),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget lowerHeader() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24.0, 32, 32.0, 0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 250,
            child: RichText(
              maxLines: 14,
              textAlign: TextAlign.start,
              overflow: TextOverflow.clip,
              softWrap: true,
              text: const TextSpan(
                text: 'Hi, ',
                style: TextStyle(color: Colors.black54, fontSize: 18),
                children: <TextSpan>[
                  TextSpan(
                      text: 'Alem',
                      style: TextStyle(decoration: TextDecoration.underline)),
                  TextSpan(text: ' have'),
                  TextSpan(
                      text: ' ETB 40,000',
                      style: TextStyle(color: kGreenColor)),
                  TextSpan(text: ' unpaid debt.'),
                ],
              ),
            ),
          ),
          GestureDetector(
            child: const Icon(
              Icons.arrow_drop_up,
              color: kProfileColor,
              size: 28.0,
            ),
            onTap: showChart,
          ),
        ],
      ),
    );
  }

  Widget topHeader() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(32.0, 0, 32.0, 0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          CircleAvatar(backgroundColor: kProfileColor),
          Icon(
            Icons.bookmark_border,
            color: Colors.grey,
            size: 24.0,
          )
        ],
      ),
    );
  }

  Widget chartView() {
    return Padding(
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
                  ListBankName(color: Colors.green, name: "Cbe"),
                  ListBankName(color: Colors.orange, name: "Awash"),
                  ListBankName(color: Colors.blue, name: "Coop"),
                  ListBankName(color: Colors.brown, name: "Birhan"),
                  ListBankName(color: Colors.red, name: "Dashen"),
                ],
              ),
            ),
            Expanded(
              flex: 7,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                child: BankChartInfo(),
              ),
            )
          ]),
    );
  }
}
