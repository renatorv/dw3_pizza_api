
import 'dart:convert';

import 'package:dw3_pizza_api/entities/menu_item.dart';

class OrderItem {
  final int id;
  final MenuItem item;
  
  OrderItem({
    required this.id,
    required this.item,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'item': item.toMap(),
    };
  }

  factory OrderItem.fromMap(Map<String, dynamic> map) {
    return OrderItem(
      id: map['id'],
      item: MenuItem.fromMap(map['item']),
    );
  }

  String toJson() => json.encode(toMap());

  factory OrderItem.fromJson(String source) => OrderItem.fromMap(json.decode(source));
}
