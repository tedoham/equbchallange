import 'package:equbchallange/data/core/api_client.dart';
import 'package:equbchallange/data/model/collected_money.dart';
import 'package:equbchallange/data/model/due_payment.dart';

abstract class PaymentRemoteDataSource {
  /// Throws [NetworkException].
  Future<List<DuePayment>> getDuePayment();
  Future<List<CollectedMoney>> getCollectedPayment();
}

class PaymentRepository extends PaymentRemoteDataSource {
  final ApiClient _client;

  PaymentRepository(this._client);

  @override
  Future<List<CollectedMoney>> getCollectedPayment() async {
    final response = await _client.get('collectedPayments');

    List<CollectedMoney> collectedMoney = collectedMoneyFromJson(response);

    return collectedMoney;
  }

  @override
  Future<List<DuePayment>> getDuePayment() async {
    final response = await _client.get('duePayments');

    List<DuePayment> duePayments = duePaymentFromJson(response);

    return duePayments;
  }
}
