import 'dart:convert';

List<CollectedMoney> collectedMoneyFromJson(String str) =>
    List<CollectedMoney>.from(
        json.decode(str).map((x) => CollectedMoney.fromJson(x)));

class CollectedMoney {
  CollectedMoney({
    required this.createdAt,
    required this.owedAmount,
    required this.dueDate,
    required this.name,
    required this.paidRounds,
    required this.totalRounds,
    required this.id,
  });

  DateTime createdAt;
  String owedAmount;
  DateTime dueDate;
  String name;
  int paidRounds;
  int totalRounds;
  String id;

  factory CollectedMoney.fromJson(Map<String, dynamic> json) => CollectedMoney(
        createdAt: json["createdAt"] == null
            ? DateTime.now()
            : DateTime.parse(json["createdAt"]),
        owedAmount: json["owedAmount"] ?? "0",
        dueDate: json["dueDate"] == null
            ? DateTime.now()
            : DateTime.parse(json["dueDate"]),
        name: json["name"] ?? "name",
        paidRounds: json["paidRounds"] ?? 0,
        totalRounds: json["totalRounds"] ?? 0,
        id: json["id"] ?? "0",
      );
}
