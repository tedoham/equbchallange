// ignore_for_file: constant_identifier_names

import 'package:equbchallange/data/core/api_client.dart';
import 'package:equbchallange/data/model/collected_money.dart';
import 'package:equbchallange/data/model/due_payment.dart';
import 'package:equbchallange/data/repository/payment_repository.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

enum PageState {
  Initial,
  Loading,
  Loaded,
  Error,
}

class PageProvider extends ChangeNotifier {
  PageState _pageState = PageState.Initial;

  final ApiClient _client = ApiClient(Client());

  List<DuePayment> duePayments = [];
  List<CollectedMoney> collectedMoney = [];

  PageState get pageState => _pageState;

  Future<void> fetchDuePayments() async {
    _pageState = PageState.Loading;
    PaymentRepository paymentRepository = PaymentRepository(_client);

    try {
      final result = await paymentRepository.getDuePayment();
      duePayments = result;
      _pageState = PageState.Loaded;
    } catch (e) {
      _pageState = PageState.Error;
    }
    notifyListeners();
  }

  Future<void> fetchCollectedMoney() async {
    _pageState = PageState.Loading;
    PaymentRepository paymentRepository = PaymentRepository(_client);

    try {
      final result = await paymentRepository.getCollectedPayment();
      collectedMoney = result;
      _pageState = PageState.Loaded;
    } catch (e) {
      _pageState = PageState.Error;
    }
    notifyListeners();
  }
}
