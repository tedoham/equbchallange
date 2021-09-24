import 'dart:convert';

List<DuePayment> duePaymentFromJson(String str) =>
    List<DuePayment>.from(json.decode(str).map((x) => DuePayment.fromJson(x)));

class DuePayment {
  DuePayment({
    required this.createdAt,
    required this.title,
    required this.frequency,
    required this.amount,
    required this.membersCount,
    required this.id,
  });

  DateTime createdAt;
  String title;
  int frequency;
  String amount;
  int membersCount;
  String id;

  factory DuePayment.fromJson(Map<String, dynamic> json) => DuePayment(
        createdAt: json["createdAt"] == null
            ? DateTime.now()
            : DateTime.parse(json["createdAt"]),
        title: json["title"] ?? "title",
        frequency: json["frequency"] ?? 0,
        amount: json["amount"] ?? "0",
        membersCount: json["membersCount"] ?? 0,
        id: json["id"] ?? 0,
      );
}
