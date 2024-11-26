// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Asset {
  final String id;
  final String name;
  final String type;
  final double quantity;
  final double purchasePrice;
  final double currentPrice;

  Asset({
    required this.id,
    required this.name,
    required this.type,
    required this.quantity,
    required this.purchasePrice,
    required this.currentPrice,
  });

  double get currentValue => quantity * currentPrice;

  double get profitOrLoss => currentValue - (quantity * purchasePrice);

  double get profitOrLossPercentage =>
      (profitOrLoss / (quantity * purchasePrice)) * 100;

  Asset copyWith({
    String? id,
    String? name,
    String? type,
    double? quantity,
    double? purchasePrice,
    double? currentPrice,
  }) {
    return Asset(
      id: id ?? this.id,
      name: name ?? this.name,
      type: type ?? this.type,
      quantity: quantity ?? this.quantity,
      purchasePrice: purchasePrice ?? this.purchasePrice,
      currentPrice: currentPrice ?? this.currentPrice,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'type': type,
      'quantity': quantity,
      'purchasePrice': purchasePrice,
      'currentPrice': currentPrice,
    };
  }

  factory Asset.fromMap(Map<String, dynamic> map) {
    return Asset(
      id: map['id'] as String,
      name: map['name'] as String,
      type: map['type'] as String,
      quantity: map['quantity'] as double,
      purchasePrice: map['purchasePrice'] as double,
      currentPrice: map['currentPrice'] as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory Asset.fromJson(String source) =>
      Asset.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Asset(name: $name, type: $type, quantity: $quantity, purchasePrice: $purchasePrice, currentPrice: $currentPrice)';
  }

  @override
  bool operator ==(covariant Asset other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.type == type &&
        other.quantity == quantity &&
        other.purchasePrice == purchasePrice &&
        other.currentPrice == currentPrice;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        type.hashCode ^
        quantity.hashCode ^
        purchasePrice.hashCode ^
        currentPrice.hashCode;
  }
}
