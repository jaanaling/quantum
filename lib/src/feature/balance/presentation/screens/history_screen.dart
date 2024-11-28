import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:quantum/src/core/utils/app_icon.dart';
import 'package:quantum/src/feature/balance/bloc/balance_bloc.dart';
import 'package:quantum/src/feature/balance/models/history.dart';
import 'package:quantum/src/feature/balance/models/values.dart';
import 'package:quantum/ui_kit/chart.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BalanceBloc, BalanceState>(
      builder: (context, state) {
        if (state is BalanceLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is BalanceError) {
          return const Center(
            child: Text('Error'),
          );
        }
        if (state is BalanceLoaded) {
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 38, 16, 0),
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.383,
                  child: state.balance.assets.isEmpty
                      ? Padding(
                          padding: const EdgeInsets.only(top: 50),
                          child: Text(
                            'Your history is currently empty. Start adding assets to track your investments.',
                            style: TextStyle(
                              fontSize: 31,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        )
                      : ListView.separated(
                        itemCount: state.history.length,
                        padding: EdgeInsets.only(top:MediaQuery.of(context).padding.top),
                        shrinkWrap: true,
                        separatorBuilder: (context, index) =>
                            const Gap(16),
                        itemBuilder: (context, index) => HistoryItem(
                          history: state.history[index],
                        ),
                      ),
                ),
              ),
              Gap(16),
              if (state.balance.assets.isNotEmpty)
              SizedBox(
                  height: MediaQuery.of(context).size.height * 0.35,
                  child: AssetChart())
            ],
          );
        }
        return const Placeholder();
      },
    );
  }
}

class HistoryItem extends StatelessWidget {
  final History history;
  const HistoryItem({super.key, required this.history});

  @override
  Widget build(BuildContext context) {
    bool isNegative = false;
    if (history.type == 'update' && history.oldAsset != null) {
      isNegative = history.oldAsset!.currentValue < history.asset.currentValue;
    }

    return DecoratedBox(
      decoration: ShapeDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xAA3700FF), Color(0xAA537BFF)],
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(19),
        ),
        shadows: const [
          BoxShadow(
            color: Color(0x21000000),
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
        child: history.type == 'update'
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${history.date.day}/${history.date.month}/${history.date.year}  type: ${history.type}',
                    style: const TextStyle(
                      color: Color(0xFFC4C4C4),
                      fontSize: 10,
                      fontWeight: FontWeight.w600,
                    ),
                    overflow: TextOverflow.fade,
                  ),
                  const Gap(8),
                  Row(
                    children: [
                      Container(
                        width: 60,
                        height: 60,
                        decoration: ShapeDecoration(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(39),
                          ),
                        ),
                        child: AppIcon(
                          asset: values[history.asset.type] ?? '',
                          width: 60,
                          height: 60,
                        ),
                      ),
                      const Gap(10),
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.43,
                                child: Text(
                                  "${history.oldAsset!.name} → ${history.asset.name}",
                                  style: const TextStyle(
                                    fontSize: 21,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  overflow: TextOverflow.fade,
                                ),
                              ),
                              
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.59,
                                child: RichText(
                                  text: TextSpan(children: [
                                    TextSpan(
                                      text:
                                          'count: ${history.oldAsset!.quantity} → ',
                                      style: TextStyle(
                                        color: Color(0xFFC4C4C4),
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    TextSpan(
                                      text: '${history.asset.quantity}',
                                      style: TextStyle(
                                        color: history.oldAsset!.quantity <=
                                                history.asset.quantity
                                            ? Color(0xFF56F56E)
                                            : Color(0xFFD95353),
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ]),
                                ),
                              ),
                           
                              Text(
                                "buying/current per unit:",
                                style: TextStyle(
                                  color: Color(0xFFFFFFFF),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.59,
                                child: RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text:
                                            '\$${history.oldAsset!.purchasePrice}/\$${history.oldAsset!.currentPrice}  → ',
                                        style: TextStyle(
                                          color: Color(0xFFFFFFFF),
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      TextSpan(
                                        text:
                                            '\$${history.asset.purchasePrice}/\$${history.asset.currentPrice}',
                                        style: TextStyle(
                                          color: isNegative
                                              ? Color(0xFF57F56F)
                                              : Color(0xFFD95353),
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${history.date.day}/${history.date.month}/${history.date.year}  type: ${history.type}',
                    style: const TextStyle(
                      color: Color(0xFFC4C4C4),
                      fontSize: 10,
                      fontWeight: FontWeight.w600,
                    ),
                    overflow: TextOverflow.fade,
                  ),
                  const Gap(8),
                  Row(
                    children: [
                      Container(
                        width: 60,
                        height: 60,
                        decoration: ShapeDecoration(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(39),
                          ),
                        ),
                        child: AppIcon(
                          asset: values[history.asset.type] ?? '',
                          width: 60,
                          height: 60,
                        ),
                      ),
                      const Gap(10),
                      Row(
                        children: [
                          Column(
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.59,
                                child: Text(
                                  history.asset.name,
                                  style: const TextStyle(
                                    fontSize: 21,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  overflow: TextOverflow.fade,
                                ),
                              ),
                 
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.59,
                                child: Text(
                                  'count: ${history.asset.quantity}',
                                  style: const TextStyle(
                                    color: Color(0xFFC4C4C4),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  overflow: TextOverflow.fade,
                                ),
                              ),
                         
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.59,
                                child: Text(
                                  'buying/current per unit: \$${history.asset.purchasePrice}/\$${history.asset.currentPrice}',
                                  style: const TextStyle(
                                    color: Color(0xFFC4C4C4),
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  overflow: TextOverflow.fade,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
      ),
    );
  }
}
