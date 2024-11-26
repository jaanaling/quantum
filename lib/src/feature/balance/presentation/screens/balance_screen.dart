import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:quantum/routes/go_router_config.dart';
import 'package:quantum/routes/route_value.dart';
import 'package:quantum/src/core/utils/app_icon.dart';
import 'package:quantum/src/feature/balance/bloc/balance_bloc.dart';
import 'package:quantum/src/feature/balance/models/asset.dart';

import '../../models/values.dart';

class BalanceScreen extends StatelessWidget {
  const BalanceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BalanceBloc, BalanceState>(
      builder: (context, state) {
        if (state is BalanceLoaded) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: [
                Gap(16),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.383,
                  child: state.balance.assets.isEmpty
                      ? Padding(
                          padding: const EdgeInsets.only(top: 50),
                          child: Text(
                            'Your portfolio is currently empty. Start adding assets to track your investments.',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 31,
                              fontFamily: 'cygre',
                              fontWeight: FontWeight.w600,
                              height: 0,
                            ),
                          ),
                        )
                      : ListView.separated(
                          shrinkWrap: true,
                          itemBuilder: (BuildContext context, int index) =>
                              AssetItem(asset: state.balance.assets[index]),
                          separatorBuilder: (BuildContext context, int index) =>
                              Gap(3),
                          itemCount: state.balance.assets.length),
                ),
                Gap(20),
                Material(
                  color: Colors.transparent,
                  child: InkWell(
                    splashColor: Color(0xFF5C81F8),
                    borderRadius: BorderRadius.circular(29),
                    onTap: () {
                      context.push(
                          '${RouteValue.portfolio.path}/${RouteValue.addAsset.path}');
                    },
                    child: Ink(
                      width: 222,
                      height: 58,
                      decoration: ShapeDecoration(
                        color: Color(0xFF3764F3),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(29),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          '+ add asset',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                            fontFamily: 'cygre',
                            fontWeight: FontWeight.w500,
                            height: 0,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}

class AssetItem extends StatelessWidget {
  final Asset asset;
  const AssetItem({super.key, required this.asset});

  @override
  Widget build(BuildContext context) {
    final isNegative = asset.profitOrLoss < 0;

    return DecoratedBox(
      decoration: ShapeDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xFF3700FF), Color(0xFF537BFF)],
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
      child: Row(
        children: [
          const Gap(16),
          Container(
            width: 60,
            height: 60,
            decoration: ShapeDecoration(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(39),
              ),
            ),
            child: AppIcon(
              asset: values[asset.type] ?? '',
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
                    width: MediaQuery.of(context).size.width * 0.43,
                    child: Text(
                      asset.name,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 21,
                        fontFamily: 'cygre',
                        fontWeight: FontWeight.w600,
                        height: 0,
                      ),
                      overflow: TextOverflow.fade,
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.43,
                    child: Text(
                      'count: ${asset.quantity}',
                      style: const TextStyle(
                        color: Color(0xFFC4C4C4),
                        fontSize: 16,
                        fontFamily: 'cygre',
                        fontWeight: FontWeight.w600,
                        height: 0,
                      ),
                      overflow: TextOverflow.fade,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Column(
                children: [
                  Text(
                    '\$ ${formatDouble(asset.currentValue)}',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 21,
                      fontFamily: 'cygre',
                      fontWeight: FontWeight.w600,
                      height: 0,
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (isNegative)
                        Container(
                          width: 16,
                          height: 10,
                          decoration: const ShapeDecoration(
                            color: Color(0xFFD85353),
                            shape: StarBorder.polygon(sides: 3),
                          ),
                        )
                      else
                        Container(
                          width: 16,
                          height: 10,
                          decoration: const ShapeDecoration(
                            color: Color(0xFF57F56F),
                            shape: StarBorder.polygon(sides: 3),
                          ),
                        ),
                      Text(
                        '${asset.profitOrLossPercentage}%',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: isNegative
                              ? const Color(0xFFD85353)
                              : const Color(0xFF56F56E),
                          fontSize: 16,
                          fontFamily: 'cygre',
                          fontWeight: FontWeight.w600,
                          height: 0,
                        ),
                      ),
                      Text(
                        '${isNegative ? '-' : '+'} \$ ${asset.profitOrLoss}',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: isNegative
                              ? const Color(0x7FD95353)
                              : const Color(0x7F56F56E),
                          fontSize: 16,
                          fontFamily: 'cygre',
                          fontWeight: FontWeight.w600,
                          height: 0,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const Gap(10),
            ],
          ),
        ],
      ),
    );
  }
}

String formatDouble(double value) {
  if (value % 1 == 0) {
    return value.toInt().toString();
  }
  return value.toString();
}
