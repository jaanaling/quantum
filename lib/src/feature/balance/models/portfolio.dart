// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:quantum/src/feature/balance/models/asset.dart';

class Portfolio {
  final List<Asset> assets;

  Portfolio({
    required this.assets,
  });
  double get totalPurchase =>
      assets.fold(0, (sum, asset) => sum + asset.purchasePrice);

  double get totalValue =>
      assets.fold(0, (sum, asset) => sum + asset.currentValue);

  double get totalProfitOrLoss =>
      assets.fold(0, (sum, asset) => sum + asset.profitOrLoss);

  Portfolio copyWith({
    List<Asset>? assets,
  }) {
    return Portfolio(
      assets: assets ?? this.assets,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'assets': assets.map((x) => x.toMap()).toList(),
    };
  }

  factory Portfolio.fromMap(Map<String, dynamic> map) {
    return Portfolio(
      assets: List<Asset>.from(
        (map['assets'] as List<int>).map<Asset>(
          (x) => Asset.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory Portfolio.fromJson(String source) =>
      Portfolio.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Portfolio(assets: $assets)';

  @override
  bool operator ==(covariant Portfolio other) {
    if (identical(this, other)) return true;

    return listEquals(other.assets, assets);
  }

  @override
  int get hashCode => assets.hashCode;

  List<AIRecommendation> generateAdvice() {
    final recommendations = <AIRecommendation>[];

    for (final asset in assets) {
      // Condition: high profitability
      if (asset.profitOrLossPercentage > 25) {
        recommendations.add(AIRecommendation(
          message:
              'Consider taking profits on ${asset.name}. Profitability has reached ${asset.profitOrLossPercentage.toStringAsFixed(2)}%.',
          timestamp: DateTime.now(),
        ));
      }

      // Condition: losses exceed 15%
      if (asset.profitOrLossPercentage < -15) {
        recommendations.add(AIRecommendation(
          message:
              '${asset.name} is showing a loss of ${asset.profitOrLossPercentage.toStringAsFixed(2)}%. Evaluate the reasons and decide whether to keep it.',
          timestamp: DateTime.now(),
          isRiskWarning: true,
        ));
      }

      // Condition: asset occupies a large share of the portfolio
      if (asset.currentValue > 0.4 * totalValue) {
        recommendations.add(AIRecommendation(
          message:
              '${asset.name} occupies more than 40% of your portfolio. Consider diversifying to reduce risks.',
          timestamp: DateTime.now(),
        ));
      }

      // Condition: minor losses
      if (asset.profitOrLossPercentage < 0 &&
          asset.profitOrLossPercentage >= -5) {
        recommendations.add(AIRecommendation(
          message:
              '${asset.name} shows a minor loss (${asset.profitOrLossPercentage.toStringAsFixed(2)}%). This could be temporary, but keep an eye on it.',
          timestamp: DateTime.now(),
        ));
      }
    }

    // Condition: overall portfolio loss
    if (totalProfitOrLoss < 0) {
      recommendations.add(AIRecommendation(
        message:
            'Your portfolio is showing a loss of ${totalProfitOrLoss.toStringAsFixed(2)}. Consider revising your asset allocation strategy.',
        timestamp: DateTime.now(),
        isRiskWarning: true,
      ));
    } else {
      // Overall portfolio profit
      recommendations.add(AIRecommendation(
        message:
            'Your portfolio is profitable: ${totalProfitOrLoss.toStringAsFixed(2)}. Consider increasing your successful investments.',
        timestamp: DateTime.now(),
      ));
    }

    // Generate additional recommendations
 recommendations.shuffle();

    // Limit the number of recommendations
    return recommendations;
  }

  // Generate additional recommendations
  List<AIRecommendation> generateAdditionalAdvice() {
    final additionalAdvice = <AIRecommendation>[];

    final adviceTemplates = [
      'Check the trends for {name} over the last 3 months. This can help forecast future changes.',
      '{name} shows unstable performance. Keep an eye on related news.',
      'Long-term prospects for {name} may be promising. Consider holding it longer.',
      'If the price of {name} decreases, consider averaging down the cost.',
      '{name} might be undervalued by the market. Explore potential growth opportunities.',
      'Your portfolio might be overly focused on {type}. Try adding more diversity.',
      'Consider locking in partial profits on {name} to free up funds for new investments.',
      'Set up alerts for {name} to track important price changes.',
      'Think about investing in similar assets to {name} for diversification.',
      'If the market continues to decline, {name} could become a good entry opportunity.'


    ];

    // Apply templates to each asset
    for (final asset in assets) {
      for (final template in adviceTemplates) {
        if (additionalAdvice.length >= 20) break;
        final message = template.replaceAll('{name}', asset.name).replaceAll(
            '{type}', asset.type == 'crypto' ? 'cryptocurrencies' : 'stocks');
        additionalAdvice.add(AIRecommendation(
          message: message,
          timestamp: DateTime.now(),
        ));
      }
    }

    // Shuffle recommendations for variety
    additionalAdvice.shuffle();
    return additionalAdvice;
  }
}

class AIRecommendation {
  final String message;
  final DateTime timestamp;
  final bool isRiskWarning;

  AIRecommendation({
    required this.message,
    required this.timestamp,
    this.isRiskWarning = false,
  });
}
