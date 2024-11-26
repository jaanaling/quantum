import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:quantum/src/feature/balance/bloc/balance_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
          return SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.only(top: 38),
            child: SafeArea(
              child: Column(
                children: [
                  const Text('Balance',
                      style: TextStyle(
                        color: Color(0xFF9E9E9E),
                        fontSize: 18,
                      )),
                  Gap(18),
                  Row(
                    children: [
                      Text(
                        "\$${state.balance.totalValue.toStringAsFixed(2)}",
                      ),
                      DecoratedBox(
                        decoration: ShapeDecoration(
                          color: state.balance.totalProfitOrLoss > 0
                              ? const Color(0xFF3C63FD)
                              : const Color(0xFFD95353),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(19.50),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(12, 10, 23, 10),
                          child: Row(
                            children: [
                              Icon(
                                state.balance.totalProfitOrLoss > 0
                                    ? Icons.arrow_upward
                                    : Icons.arrow_downward,
                                color: Colors.white,
                                size: 18,
                              ),
                              Gap(6),
                              Text(
                                '${state.balance.totalProfitOrLoss.toStringAsFixed(2)}\$',
                                style: TextStyle(
                                  fontSize: 22,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    width: 330,
                    height: 112,
                    decoration: ShapeDecoration(
                      color: const Color(0x474C00FF),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                    child: Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 20),
                          child: Align(
                            alignment: Alignment.topRight,
                            child: Text(
                              'Asset value',
                              style: TextStyle(
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),
                        Center(
                          child: Text(
                            "\$${state.balance.totalValue.toStringAsFixed(2)}",
                            style: TextStyle(
                              fontSize: 32,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        }
        return const Placeholder();
      },
    );
  }
}
