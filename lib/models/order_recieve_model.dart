import 'dart:convert';

List<OrderRecieveModel> orderRecieveModelFromJson(String str) =>
    List<OrderRecieveModel>.from(
        json.decode(str).map((x) => OrderRecieveModel.fromJson(x)));

String orderRecieveModelToJson(List<OrderRecieveModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class OrderRecieveModel {
  final String id;
  final String userId;
  final String imageUser;
  final String nameUser;
  final String address;
  final String imageProduct;
  final String nameProduct;
  final int price;
  final String type;
  final String orderStatus;
  final String storeName;
  final String dealerImage;
  final String dealerId;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int v;

  OrderRecieveModel({
    required this.id,
    required this.userId,
    required this.imageUser,
    required this.nameUser,
    required this.address,
    required this.imageProduct,
    required this.nameProduct,
    required this.price,
    required this.type,
    required this.orderStatus,
    required this.storeName,
    required this.dealerImage,
    required this.dealerId,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  factory OrderRecieveModel.fromJson(Map<String, dynamic> json) =>
      OrderRecieveModel(
        id: json["_id"],
        userId: json["userId"],
        imageUser: json["imageUser"],
        nameUser: json["nameUser"],
        address: json["address"],
        imageProduct: json["imageProduct"],
        nameProduct: json["nameProduct"],
        price: json["price"],
        type: json["type"],
        orderStatus: json["orderStatus"],
        storeName: json["storeName"],
        dealerImage: json["dealerImage"],
        dealerId: json["dealerId"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "userId": userId,
        "imageUser": imageUser,
        "nameUser": nameUser,
        "address": address,
        "imageProduct": imageProduct,
        "nameProduct": nameProduct,
        "price": price,
        "type": type,
        "orderStatus": orderStatus,
        "storeName": storeName,
        "dealerImage": dealerImage,
        "dealerId": dealerId,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
      };
}
