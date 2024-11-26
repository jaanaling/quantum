import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quantum/src/core/utils/icon_provider.dart';
import 'package:quantum/src/feature/balance/bloc/balance_bloc.dart';

class RoboTips extends StatelessWidget {
  const RoboTips({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BalanceBloc, BalanceState>(
      listener: (context, state) {
        if (state is BalanceLoaded) {
          Future.delayed(Duration(minutes: 1)).then((value) {
            context.read<BalanceBloc>().add(LoadBalance());
          });
        }
      },
      builder: (context, state) {
        if (state is BalanceLoaded) {
          return Stack(
            children: [
              Stack(
                children: [
                  Text(
                    state.balance.generateAdvice().first.message,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 19,
                    ),
                  ),
                  Image.asset(
                    IconProvider.dialog.buildImageUrl(),
                    fit: BoxFit.cover,
                    width: MediaQuery.of(context).size.width / 3,
                  ),
                ],
              ),
              Image.asset(
                IconProvider.ai.buildImageUrl(),
                fit: BoxFit.cover,
                height: MediaQuery.of(context).size.height / 3,
              ),
            ],
          );
        }
        return const Placeholder();
      },
    );
  }
}
