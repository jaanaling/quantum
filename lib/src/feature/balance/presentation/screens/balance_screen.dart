import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:quantum/routes/go_router_config.dart';
import 'package:quantum/routes/route_value.dart';
import 'package:quantum/src/core/utils/app_icon.dart';
import 'package:quantum/src/feature/balance/bloc/balance_bloc.dart';
import 'package:quantum/src/feature/balance/models/asset.dart';
import 'package:quantum/ui_kit/chart.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:syncfusion_flutter_pdf/pdf.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

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
                  height: MediaQuery.of(context).size.height * 0.35,
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
                              Gap(12),
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
                Gap(20),
                SizedBox(
                    height: MediaQuery.of(context).size.height * 0.35,
                    child: AssetsChart()),
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
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
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
            Expanded(
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.4,
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                asset.name,
                                style: const TextStyle(
                                  fontSize: 21,
                                  fontWeight: FontWeight.w600,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.23,
                        child: Text(
                          'count: ${asset.quantity}',
                          style: const TextStyle(
                            color: Color(0xFFC4C4C4),
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const Gap(8),
                      CupertinoButton(
                        alignment: Alignment.topLeft,
                        onPressed: () {
                        context.read<BalanceBloc>().add(RemoveBalance( asset));
                        },
                        child: Icon(
                          (CupertinoIcons.delete_solid),
                          color: Color(0xFFF27373),
                          size: 24,
                        ),
                        padding: EdgeInsets.zero,
                      ),
                    ],
                  ),
                  Spacer(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      CupertinoButton(
                        alignment: Alignment.topRight,
                        onPressed: () {
                          context.push(
                              '${RouteValue.portfolio.path}/${RouteValue.addAsset.path}',
                              extra: asset);
                        },
                        child: Icon(
                          (CupertinoIcons.pencil_ellipsis_rectangle),
                          color: Color(0xFFC5CEFF),
                          size: 36,
                        ),
                        padding: EdgeInsets.zero,
                      ),
                      Text(
                        '\$ ${formatDouble(asset.currentValue)}',
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 21,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const Gap(8),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          if (isNegative)
                            Container(
                              width: 16,
                              height: 10,
                              decoration: const ShapeDecoration(
                                color: Color(0xFFD85353),
                                shape:
                                    StarBorder.polygon(sides: 3, rotation: 180),
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
                            '${asset.profitOrLossPercentage.toStringAsFixed(2)}%',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: isNegative
                                  ? const Color(0xFFD85353)
                                  : const Color(0xFF56F56E),
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      const Gap(8),
                      Text(
                        '\$ ${asset.profitOrLoss}',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: isNegative
                              ? const Color(0x7FD95353)
                              : const Color(0x7F56F56E),
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
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
