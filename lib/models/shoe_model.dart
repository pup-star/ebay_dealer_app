import 'dart:convert';

List<ShoesModel> shoesModelFromJson(String str) =>
    List<ShoesModel>.from(json.decode(str).map((x) => ShoesModel.fromJson(x)));

String shoesModelToJson(List<ShoesModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ShoesModel {
  final String id;
  final String dealerId;
  final String title;
  final String imageUrl;
  final int price;
  final String description;
  final String size;
  final String type;
  final String dealerName;
  final DateTime createdAt;
  final DateTime updatedAt;

  ShoesModel({
    required this.id,
    required this.dealerId,
    required this.title,
    required this.imageUrl,
    required this.price,
    required this.description,
    required this.size,
    required this.type,
    required this.dealerName,
    required this.createdAt,
    required this.updatedAt,
  });

  factory ShoesModel.fromJson(Map<String, dynamic> json) => ShoesModel(
        id: json["_id"],
        dealerId: json["dealerId"],
        title: json["title"],
        imageUrl: json["imageUrl"],
        price: json["price"],
        description: json["description"],
        size: json["size"],
        type: json["type"],
        dealerName: json["dealerName"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "dealerId": dealerId,
        "title": title,
        "imageUrl": imageUrl,
        "price": price,
        "description": description,
        "size": size,
        "type": type,
        "dealerName": dealerName,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
      };
}
