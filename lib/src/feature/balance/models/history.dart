// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:quantum/src/feature/balance/models/asset.dart';

class History {
  Asset asset;
  Asset? oldAsset;
  DateTime date;
  String type;
  double balance;

  History({
    this.oldAsset,
    required this.asset,
    required this.date,
    required this.type,
    this.balance = 0,
  });

  History copyWith({
    Asset? asset,
    Asset? oldAsset,
    DateTime? date,
    String? type,
    double? balance,
  }) {
    return History(
      oldAsset: oldAsset ?? this.oldAsset,
      asset: asset ?? this.asset,
      date: date ?? this.date,
      type: type ?? this.type,
      balance: balance ?? this.balance,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'asset': asset.toMap(),
      'date': date.millisecondsSinceEpoch,
      'type': type,
      'oldAsset': oldAsset?.toMap(),
      'balance': balance,
    };
  }

  factory History.fromMap(Map<String, dynamic> map) {
    return History(
      oldAsset: map['oldAsset'] != null
          ? Asset.fromMap(map['oldAsset'] as Map<String, dynamic>)
          : null,
      asset: Asset.fromMap(map['asset'] as Map<String, dynamic>),
      date: DateTime.fromMillisecondsSinceEpoch(map['date'] as int),
      type: map['type'] as String,
      balance: map['balance'] as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory History.fromJson(String source) =>
      History.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'History(asset: $asset, date: $date)';

  @override
  bool operator ==(covariant History other) {
    if (identical(this, other)) return true;

    return other.asset == asset &&
        other.oldAsset == oldAsset &&
        other.type == type &&
        other.balance == balance &&
        other.date == date;
  }

  @override
  int get hashCode => asset.hashCode ^ date.hashCode ^ type.hashCode;
}
