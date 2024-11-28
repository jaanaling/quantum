// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:quantum/src/feature/balance/models/asset.dart';
import 'package:quantum/src/feature/balance/models/values.dart';

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
        recommendations.add(
          AIRecommendation(
            message:
                'Consider taking profits on ${asset.name}. Profitability has reached ${asset.profitOrLossPercentage.toStringAsFixed(2)}%.',
            timestamp: DateTime.now(),
          ),
        );
      }

      // Condition: losses exceed 15%
      if (asset.profitOrLossPercentage < -15) {
        recommendations.add(
          AIRecommendation(
            message:
                '${asset.name} is showing a loss of ${asset.profitOrLossPercentage.toStringAsFixed(2)}%. Evaluate the reasons and decide whether to keep it.',
            timestamp: DateTime.now(),
            isRiskWarning: true,
          ),
        );
      }

      // Condition: asset occupies a large share of the portfolio
      if (asset.currentValue > 0.4 * totalValue) {
        recommendations.add(
          AIRecommendation(
            message:
                '${asset.name} occupies more than 40% of your portfolio. Consider diversifying to reduce risks.',
            timestamp: DateTime.now(),
          ),
        );
      }

      // Condition: minor losses
      if (asset.profitOrLossPercentage < 0 &&
          asset.profitOrLossPercentage >= -5) {
        recommendations.add(
          AIRecommendation(
            message:
                '${asset.name} shows a minor loss (${asset.profitOrLossPercentage.toStringAsFixed(2)}%). This could be temporary, but keep an eye on it.',
            timestamp: DateTime.now(),
          ),
        );
      }
    }

    // Condition: overall portfolio loss
    if (totalProfitOrLoss < 0) {
      recommendations.add(
        AIRecommendation(
          message:
              'Your portfolio is showing a loss of ${totalProfitOrLoss.toStringAsFixed(2)}. Consider revising your asset allocation strategy.',
          timestamp: DateTime.now(),
          isRiskWarning: true,
        ),
      );
    } else {
      // Overall portfolio profit
      recommendations.add(
        AIRecommendation(
          message:
              'Your portfolio is profitable: ${totalProfitOrLoss.toStringAsFixed(2)}. Consider increasing your successful investments.',
          timestamp: DateTime.now(),
        ),
      );
    }

    // Generate additional recommendations
    recommendations.shuffle();

    // Limit the number of recommendations
    return recommendations;
  }

  // Generate additional recommendations
  List<AIRecommendation> generateAdditionalAdvice() {
    final additionalAdvice = <AIRecommendation>[];

    final adviceTipsTemplates = [
      'Review the performance of this investment over the past year to identify trends.',
      'This asset appears volatile. Monitor closely for potential opportunities.',
      'Consider the long-term growth potential of this investment before making decisions.',
      'In case of a price drop, averaging down could be a viable strategy.',
      'Market analysis suggests this asset might be undervalued. Investigate further.',
      'Diversify your portfolio to reduce risk from over-concentration in one sector.',
      'Locking in partial profits could help secure gains and provide liquidity.',
      'Set notifications for significant price movements to stay informed.',
      'Explore related investment options for better diversification.',
      'A declining market could present attractive buying opportunities.',
      'Regularly reassess the risk profile of your investments.',
      'Be mindful of fees and charges associated with maintaining this asset.',
      'Keep an emergency fund separate to avoid forced liquidation of investments.',
      'Reinvest dividends or earnings to maximize compound growth.',
      'Ensure your investments align with your financial goals and risk tolerance.',
      'Research upcoming industry trends that could impact this asset.',
      'Review the impact of inflation on your portfolio’s returns.',
      'Investing incrementally can help mitigate the risk of market timing.',
      'Stay updated with economic indicators that could affect the market.',
      'Don’t let emotional decisions influence your investment strategy.',
      'Review tax implications before making changes to your portfolio.',
      'Monitor the asset’s performance relative to market benchmarks.',
      'Consider using stop-loss orders to limit potential losses.',
      'Ensure your portfolio is balanced between growth and defensive assets.',
      'Evaluate the liquidity of this asset before committing funds.',
      'Review company earnings reports if this investment involves stocks.',
      'Look into the historical correlation of this asset with the broader market.',
      'Understand the regulatory environment that could affect this investment.',
      'Regularly rebalance your portfolio to maintain your desired asset allocation.',
      'Avoid chasing short-term trends without solid research.',
      'Be cautious about overextending your budget when investing.',
      'Consider hedging strategies to mitigate risks during market downturns.',
      'Review the credit rating of issuers if investing in bonds.',
      'Keep an eye on currency exchange rates if investing internationally.',
      'Take into account geopolitical events that could impact markets.',
      'Evaluate the dividend yield and growth history of this asset.',
      'Consider splitting large investments into smaller, staggered purchases.',
      'Assess the competitive landscape if this involves sector-specific investments.',
      'Review the expense ratios of mutual funds or ETFs in your portfolio.',
      'Use dollar-cost averaging to reduce the impact of market volatility.',
      'Don’t rely solely on past performance as an indicator of future results.',
      'Ensure you’re not over-leveraged in case of sudden market corrections.',
      'Monitor earnings-to-price ratios for insights into asset valuation.',
      'Research new technologies or innovations impacting this industry.',
      'Understand the risks associated with this type of investment.',
      'Seek professional advice if unsure about complex investment options.',
      'Keep an eye on central bank policies influencing interest rates.',
      'Plan for long-term capital appreciation rather than short-term gains.',
      'Consider the potential impact of market cycles on your portfolio.',
      'Evaluate growth vs. value investment strategies for better balance.',
      'Don’t let herd mentality influence your investment decisions.',
      'Diversify not only across sectors but also across asset classes.',
      'Avoid investments that you don’t fully understand.',
      'Review management fees and other hidden costs associated with this investment.',
      'Have a clear exit strategy in place before entering any investment.',
      'Keep track of macroeconomic factors that could impact the market.',
      'Reinvesting gains can help build wealth over the long term.',
      'Avoid overtrading as it could lead to unnecessary transaction costs.',
      'Maintain a long-term perspective to weather short-term market fluctuations.',
      'Understand how interest rates affect this investment’s performance.',
      'Look into seasonal trends that could impact market conditions.',
      'Consider environmental, social, and governance (ESG) factors in your investments.',
      'Review your investment goals periodically to ensure alignment.',
      'Be patient; market volatility often creates opportunities.',
      'Look for opportunities to reduce your average cost during downturns.',
      'Keep your portfolio flexible to adapt to changing market conditions.',
      'Avoid putting all your funds into a single investment, no matter how promising.',
      'Don’t ignore the importance of cash flow when analyzing investments.',
      'Set realistic return expectations based on historical performance.',
      'Understand the impact of leverage on your overall investment risk.',
      'Stay diversified even during market rallies to avoid overexposure.',
      'Assess the track record of fund managers or investment teams.',
      'Be prepared for market corrections; they are a natural part of the cycle.',
      'Avoid selling in panic during market downturns unless absolutely necessary.',
      'Prioritize investments that align with your risk appetite.',
      'Evaluate alternative assets to add variety to your portfolio.',
      'Stay disciplined with your investment strategy during market highs.',
      'Consider adding inflation-protected securities for stability.',
      'Be aware of liquidity risks in low-volume markets.',
      'Keep an eye on sector rotation trends in the economy.',
      'Review financial ratios to understand asset performance better.',
      'Understand the potential impact of currency risk on international investments.',
      'Stay updated with news related to this asset class or industry.',
      'Be cautious with speculative investments; they can carry higher risks.',
      'Ensure your portfolio remains diversified across different geographies.',
      'Reassess the role of this investment in your portfolio during major life changes.',
      'Understand how dividends are taxed in your jurisdiction.',
      'Consider reallocating funds if one investment becomes disproportionately large.',
      'Ensure your portfolio includes a mix of growth and income assets.',
      'Avoid letting short-term noise distract from long-term goals.',
      'Periodically review your asset allocation to adjust for market changes.',
      'Maintain an investment journal to track decisions and learn from past outcomes.',
      'Be wary of advice that promises guaranteed returns.',
      'Take advantage of employer matching programs if available for investments.',
      'Stay informed about emerging market opportunities with caution.',
      'Review the impact of technology adoption on traditional industries.',
    ];

    final adviceAddedTemplates = [
      '{name} has recently shown strong growth. Analyze whether it’s a good time to invest.',
      'Before investing in {name}, ensure it aligns with your financial goals.',
      '{name} could offer potential for income. Review dividend or interest opportunities.',
      'If {name} is nearing its all-time high, evaluate the risk of correction.',
      'Stay updated on industry news impacting {name}. It can affect performance.',
      'Diversify your holdings by adding {type} assets alongside {name}.',
      'Reassess your portfolio to ensure {name} doesn’t occupy an oversized position.',
      'Investing in {name} may reduce overall portfolio volatility. Consider the risk-benefit ratio.',
      'Compare the historical P/E ratios of {name} with industry averages.',
      '{name} could benefit from a sector-wide rally. Monitor related industries.',
      'Review transaction costs and fees before buying or selling {name}.',
      'Timing the market for {name} can be risky. Focus on long-term value.',
      'Consider the liquidity of {name} to ensure easy buying or selling.',
      'Evaluate whether {name} aligns with your investment timeline.',
      'A sudden drop in {name} might indicate an opportunity. Do your research first.',
      '{name} might be overvalued. Look for signs of a bubble.',
      'Analyze the credit rating of {name} if it’s a fixed-income investment.',
      'Holding {name} for too long can lead to diminishing returns. Monitor regularly.',
      'If {name} is tied to a specific currency, watch for forex fluctuations.',
      'Ensure {name} complements the risk level of your current portfolio.',
      'Incorporating {name} could hedge against inflation risks.',
      'Before selling {name}, consider the impact of taxes on your returns.',
      'Investing in {name} may protect against market downturns due to its stability.',
      'Watch for seasonal trends that might impact {name}.',
      'Consider dollar-cost averaging when investing in volatile assets like {name}.',
      'Compare {name} with other options in its sector for relative performance.',
      'If {name} has strong fundamentals, short-term dips may not matter.',
      'Avoid emotional decisions when dealing with sudden price changes in {name}.',
      'Research competitors of {name} to understand market dynamics.',
      '{name} might be impacted by regulatory changes. Stay informed.',
      'Review historical returns of {name} to set realistic expectations.',
      'Use stop-loss orders to protect gains or minimize losses on {name}.',
      'Don’t over-leverage your portfolio with {name}. Balance is key.',
      'If {name} is new to the market, consider starting with a small position.',
      'Reinvesting dividends from {name} could accelerate portfolio growth.',
      'Stay updated on geopolitical factors affecting {name}.',
      'Review analyst opinions about {name} to gain diverse insights.',
      'Consider sector-specific funds that include {name} for broader exposure.',
      'Evaluate the management team behind {name} for their expertise.',
      'Look at the ESG (environmental, social, governance) factors for {name}.',
      'Keep emergency savings separate from investments like {name}.',
      '{name} might perform differently during economic expansions or contractions.',
      'Track inflation-adjusted returns of {name} for a realistic view.',
      'If you’re unsure about {name}, consult a financial advisor.',
      'Avoid chasing recent high performance of {name} without understanding risks.',
      'Include low-risk assets to balance higher-risk options like {name}.',
      'Consider tax-advantaged accounts for holding {name}.',
      '{name} may have exposure to emerging markets. Analyze potential risks.',
      'When markets are volatile, {name} could stabilize your portfolio.',
      'Avoid overreacting to short-term news affecting {name}.',
      'If {name} pays dividends, reinvesting them could boost returns.',
      'Monitor macroeconomic indicators for clues about {name}’s performance.',
      'Assess how {name} interacts with other assets in your portfolio.',
      'Keep a long-term perspective for growth-oriented investments like {name}.',
      'Rebalance your portfolio regularly to prevent overexposure to {name}.',
      'If {name} has performed poorly, evaluate if it’s a temporary setback.',
      'A high yield on {name} may indicate increased risk. Investigate thoroughly.',
      '{name} may benefit from technological advancements in its sector.',
      'Don’t rely solely on past performance to predict {name}’s future.',
      'Focus on total returns, not just yield, when assessing {name}.',
      'In a bear market, {name} could offer defensive qualities.',
      'Stay disciplined with your investment strategy involving {name}.',
      '{name} might benefit from currency hedging in international markets.',
      'Avoid investing more in {name} than you can afford to lose.',
      'Watch for insider activity or large trades affecting {name}.',
      '{name} could provide diversification across asset classes.',
      'Look for government incentives that may apply to {name}.',
      'Keep track of expiration dates for options related to {name}.',
      '{name} could hedge against deflationary risks. Research thoroughly.',
      'Monitor debt levels associated with {name} for financial health.',
      'Use a risk management plan when holding volatile assets like {name}.',
      'If {name} is highly speculative, keep its allocation small.',
      'Don’t ignore currency risks if {name} operates internationally.',
      '{name} may benefit from cyclical market trends. Plan accordingly.',
      'Avoid market timing with {name}; stay consistent with your strategy.',
      '{name} might underperform in rising interest rate environments. Analyze carefully.',
      'Stay patient when investing in long-term assets like {name}.',
      'Look at past crisis performance of {name} for resilience insights.',
      'Evaluate the expense ratio of funds holding {name}.',
      'Be cautious of herd mentality when investing in trending options like {name}.',
      '{name} might hedge your portfolio against geopolitical uncertainty.',
      'Automating contributions to {name} can help with disciplined investing.',
      'Track benchmarks to measure the relative performance of {name}.',
      'If {name} faces major competition, reassess its growth potential.',
      'Evaluate whether {name} fits your risk tolerance and investment horizon.',
      'Ensure you have sufficient knowledge about {name} before investing.',
      '{name} could offer diversification across global markets.',
      'Beware of high fees associated with funds that include {name}.',
      'If {name} has a strong moat, it might outperform in the long run.',
      'Avoid concentrating your portfolio solely on {name} or its sector.',
      'Review economic indicators that directly affect {name}.',
      '{name} could act as a buffer during volatile market conditions.',
      'Monitor quarterly earnings reports for updates on {name}.',
      'Track insider trading to gauge confidence in {name}.',
      '{name} might correlate closely with commodities or indices. Analyze trends.',
      'Set clear entry and exit strategies when dealing with {name}.',
      'Consider pairing {name} with complementary assets to reduce volatility.'
    ];

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
      'If the market continues to decline, {name} could become a good entry opportunity.',
      'Review recent news for {name} to understand potential impacts on its performance.',
      '{name} could benefit from upcoming economic shifts. Stay informed.',
      'Monitor {name} for signals indicating a good exit point.',
      '{name} has a strong historical performance. Consider its role in your long-term strategy.',
      'Pay attention to expert analysis on {name} to validate your decisions.',
      '{name} could be affected by regulatory changes. Research upcoming policies.',
      'If you see a dip in {name}, it might be a chance to buy more.',
      'The current momentum of {name} suggests potential short-term gains.',
      'Avoid emotional decisions regarding {name}; rely on data-driven insights.',
      'Diversify further if {name} occupies a significant share of your portfolio.',
      'The seasonal trends of {name} might offer clues about the next steps.',
      '{name} may show growth in emerging markets. Research its global exposure.',
      'Consider reinvesting dividends from {name} for compound growth.',
      'Evaluate whether {name} aligns with your overall financial goals.',
      'Rebalance your portfolio if {name} outgrows its intended allocation.',
      'Check if {name} aligns with recent market sentiment changes.',
      'Analyze the latest earnings report for {name} to assess its health.',
      'Set a stop-loss on {name} to manage potential risks.',
      'If {name} is too volatile, consider safer alternatives for balance.',
      'Track competitor performance to gauge the position of {name}.',
      'Evaluate your exposure to {type} and consider reallocating funds.',
      'Consider the impact of inflation on {name} and adjust accordingly.',
      '{name} might benefit from a recovering economy. Follow macroeconomic trends.',
      'Use technical analysis to identify support levels for {name}.',
      '{name} might be at risk in a bearish market. Plan a defensive strategy.',
      'Seek professional advice on optimizing your investment in {name}.',
      'If {name} exceeds your target profit, secure your gains.',
      'Research institutional interest in {name} to assess its credibility.',
      'Factor in transaction costs when making decisions about {name}.',
      '{name} might be influenced by currency fluctuations. Monitor exchange rates.',
      'Pay attention to dividend yield trends for {name} to maximize returns.',
      '{name} could be a good candidate for a value investing strategy.',
      'Compare {name} with similar assets to gauge its relative performance.',
      'Consider the environmental impact of {name} if sustainability matters to you.',
      'If {name} underperforms, reassess its place in your portfolio.',
      'Follow social media sentiment to track hype around {name}.',
      'Allocate a fixed percentage to {name} to manage exposure effectively.',
      'Think about using dollar-cost averaging for {name} in a volatile market.',
      'Revisit your risk tolerance before making decisions about {name}.',
      '{name} could offer stability in uncertain market conditions.',
      'Look for potential mergers or acquisitions involving {name}.',
      'Examine analyst ratings for {name} to support your strategy.',
      '{name} might benefit from innovations in its sector.',
      'Keep tabs on global events that could influence {name}.',
      'Check liquidity levels for {name} before making major moves.',
      'Reassess your time horizon for {name} in light of new developments.',
      'Review tax implications of selling {name} before acting.',
      'Consider reallocating funds from {name} to higher-performing assets.',
      'Factor in geopolitical risks affecting {name} in your plans.',
      'Maintain a balanced view of risks and rewards for {name}.',
      'If {name} consistently meets expectations, consider increasing exposure.',
      'Check if {name} aligns with your ethical investment criteria.',
      'Anticipate earnings season for {name} to prepare for potential volatility.',
      'Research historical drawdowns for {name} to manage your expectations.',
      'Monitor insider trading activity related to {name} for clues.',
      'If {name} shows consistent growth, think about reinvesting profits.',
      'Look for correlation patterns between {name} and broader markets.',
      'Reassess your exit strategy for {name} periodically.',
      'Use trailing stop orders for {name} to lock in profits.',
      '{name} might be affected by sector rotation. Track market trends.',
      'Diversify by investing in assets with a different risk profile than {name}.',
      'Watch for seasonal demand fluctuations for {name}.',
      'Factor in emerging technologies that could impact {name}.',
      'Use fundamental analysis to validate your position in {name}.',
      'Explore alternative income streams if {name} underperforms.',
      'Review peer performance to evaluate the relative strength of {name}.',
      'If {name} is high-risk, consider pairing it with stable assets.',
      'Track volume trends for {name} to identify buying or selling pressure.',
      'Assess whether recent moves in {name} are driven by speculation.',
      '{name} might gain from upcoming industry growth. Stay informed.',
      'Use a diversified approach to complement the potential of {name}.',
      'Think about hedging your position in {name} against market downturns.',
      'The historical volatility of {name} may inform your risk management.',
      'Track the management team behind {name} for confidence in its potential.',
      'If {name} is undervalued, consider it a long-term growth opportunity.',
      'Pay attention to consumer trends that could affect {name}.',
      'Ensure {name} aligns with your liquidity needs.',
      'Look for technical breakouts in {name} to identify entry points.',
      'Watch interest rate changes that may influence {name}.',
      'Research macroeconomic indicators for a broader view of {name}.',
      'If {name} consistently underperforms, consider rotating into stronger assets.',
      'Follow expert commentary on {name} for a fresh perspective.',
      '{name} could gain from changes in global trade policies. Monitor developments.',
      'Examine recent innovations in the industry to gauge {name}’s growth potential.',
      'Stay updated on environmental factors that might impact {name}.',
      'Think about the impact of market cycles on {name}.',
      'Regularly update your strategy to keep {name} aligned with your goals.',
      '{name} might benefit from upcoming fiscal policies.',
      'If your conviction in {name} weakens, consider reallocating funds.',
      'Plan for contingency actions if {name} faces unexpected challenges.',
      'Be mindful of over-allocating to {name} during bull markets.',
      'Think about leveraging ETFs or mutual funds alongside {name} for balance.'
    ];

    for (final template in adviceTipsTemplates) {
     
      final message = template;
      additionalAdvice.add(
        AIRecommendation(
          message: message,
          timestamp: DateTime.now(),
        ),
      );
    }

    for (final template in adviceAddedTemplates) {
      for (final asset in values.keys) {
      
        final message = template.replaceAll('{name}', asset).replaceAll(
              '{type}',
              asset != 'DEP' ? 'cryptocurrencies' : 'stocks',
            );
        additionalAdvice.add(
          AIRecommendation(
            message: message,
            timestamp: DateTime.now(),
          ),
        );
      }
    }
    // Apply templates to each asset

    for (final template in adviceTemplates) {
      for (final asset in assets) {
       
        final message = template.replaceAll('{name}', asset.name).replaceAll(
              '{type}',
              asset.type != 'DEP' ? 'cryptocurrencies' : 'stocks',
            );
        additionalAdvice.add(
          AIRecommendation(
            message: message,
            timestamp: DateTime.now(),
          ),
        );
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
