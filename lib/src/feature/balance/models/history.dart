// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:quantum/src/feature/balance/models/asset.dart';

class History {
  Asset asset;
  DateTime date;
  String type;
  History({
    required this.asset,
    required this.date,
    required this.type,
  });
  

  History copyWith({
    Asset? asset,
    DateTime? date,
  }) {
    return History(
      asset: asset ?? this.asset,
      date: date ?? this.date,
      type: type,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'asset': asset.toMap(),
      'date': date.millisecondsSinceEpoch,
      'type': type,
    };
  }

  factory History.fromMap(Map<String, dynamic> map) {
    return History(
      asset: Asset.fromMap(map['asset'] as Map<String,dynamic>),
      date: DateTime.fromMillisecondsSinceEpoch(map['date'] as int),
      type: map['type'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory History.fromJson(String source) => History.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'History(asset: $asset, date: $date)';

  @override
  bool operator ==(covariant History other) {
    if (identical(this, other)) return true;
  
    return 
      other.asset == asset &&
      other.type == type &&
      other.date == date;
  }

  @override
  int get hashCode => asset.hashCode ^ date.hashCode ^ type.hashCode;
}
