import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quantum/src/feature/balance/bloc/balance_bloc.dart';
import 'package:quantum/src/feature/balance/models/portfolio.dart';
import 'package:quantum/ui_kit/robo_tips.dart';

class TipsScreen extends StatelessWidget {
  const TipsScreen({super.key});

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
          final List<AIRecommendation> tips =
              state.balance.generateAdditionalAdvice();
          return Stack(
            children: [
              const RoboTips(),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 220),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    tipItem(tips.first.message),
                    tipItem(tips[1].message),
                    tipItem(tips[2].message),
                    CupertinoButton(
                      onPressed: () {
                        context.read<BalanceBloc>().add(LoadBalance());
                      },
                      child: DecoratedBox(
                        decoration: ShapeDecoration(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(29),
                          ),
                          shadows: [
                            BoxShadow(
                              color: Color(0x1E000000),
                              blurRadius: 4,
                              offset: Offset(2, 3),
                              spreadRadius: 0,
                            )
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 47, vertical: 12),
                          child: Text(
                            'get advice',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 17,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          );
        }
        return const Placeholder();
      },
    );
  }

  Container tipItem(String text) {
    return Container(
      width: double.infinity,
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
            spreadRadius: 0,
          )
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}
