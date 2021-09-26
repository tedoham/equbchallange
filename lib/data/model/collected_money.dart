import 'dart:convert';

List<CollectedMoney> collectedMoneyFromJson(String str) =>
    List<CollectedMoney>.from(
        json.decode(str).map((x) => CollectedMoney.fromJson(x)));

class CollectedMoney {
  CollectedMoney({
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

  factory CollectedMoney.fromJson(Map<String, dynamic> json) => CollectedMoney(
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
