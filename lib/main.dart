import 'package:equbchallange/presentation/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

import 'data/core/api_client.dart';
import 'data/repository/payment_repository.dart';

void main() async {
  // final ApiClient _client = ApiClient(Client());
  // PaymentRepository paymentRepository = new PaymentRepository(_client);
  // print("----testing api result--->>");
  // print(await paymentRepository.getDuePayment());
  // print(await paymentRepository.getCollectedPayment());

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Equb Challange',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}
