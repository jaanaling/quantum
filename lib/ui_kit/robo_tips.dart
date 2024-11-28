// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:quantum/src/core/utils/icon_provider.dart';
import 'package:quantum/src/core/utils/log.dart';
import 'package:quantum/src/feature/balance/bloc/balance_bloc.dart';

class RoboTips extends StatefulWidget {
  final BalanceLoaded state;

  const RoboTips({
    super.key,
    required this.state,
  });

  @override
  State<RoboTips> createState() => _RoboTipsState();
}

class _RoboTipsState extends State<RoboTips> {
  late Timer _timer;
  String advice = '';

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _startTimer(() => setState(() {
            final advices = widget.state.balance.generateAdvice();
            advice = advices.first.message;
            logger.d(advices.length);
          }));
    });
    super.initState();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void _startTimer(Function func) {
    func();
    _timer = Timer.periodic(const Duration(seconds: 60), (timer) {
      func();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 86),
          child: Align(
            alignment: Alignment.topRight,
            child: Image.asset(
              IconProvider.ai.buildImageUrl(),
              fit: BoxFit.cover,
              height: MediaQuery.of(context).size.height / 3,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 16, top: 16),
          child: Align(
             alignment: Alignment.topLeft,
            child: Container(
                padding: EdgeInsets.symmetric(horizontal: 25, vertical: 45),
              width: MediaQuery.of(context).size.width / 1.5,
              decoration: BoxDecoration(
                  color: Colors.transparent,
                  image: DecorationImage(
                    image: AssetImage(
                      IconProvider.dialog.buildImageUrl(),
                    ),
                    fit: BoxFit.fitWidth,
                  )),
              child: Text(
                advice,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 19,
          
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
