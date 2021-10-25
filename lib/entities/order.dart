import 'dart:convert';

import 'package:dw3_pizza_api/entities/order_item.dart';

class Order {
  final int id;
  final String paymentType;
  final String address;
  final List<OrderItem> items;

  Order({
    required this.id,
    required this.paymentType,
    required this.address,
    required this.items,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'paymentType': paymentType,
      'address': address,
      'items': items.map((x) => x.toMap()).toList(),
    };
  }

  factory Order.fromMap(Map<String, dynamic> map) {
    return Order(
      id: map['id'],
      paymentType: map['paymentType'],
      address: map['address'],
      items:
          List<OrderItem>.from(map['items']?.map((x) => OrderItem.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory Order.fromJson(String source) => Order.fromMap(json.decode(source));
}
