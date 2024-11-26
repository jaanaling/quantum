import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:quantum/src/feature/balance/bloc/balance_bloc.dart';

import '../../../../routes/go_router_config.dart';

class AppRoot extends StatelessWidget {
  const AppRoot({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BalanceBloc, BalanceState>(
      builder: (context, state) {
        return CupertinoApp.router(
          theme: const CupertinoThemeData(
            brightness: Brightness.light,
            primaryColor: Color(0xFF1895FB),
            textTheme: CupertinoTextThemeData(
              textStyle: TextStyle(
                fontFamily: 'cygre',
                fontWeight: FontWeight.w500,
                fontSize: 32,
                color: Colors.white,
                 height: 0,
              ),            
            ),
          ),
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          routerConfig: buildGoRouter,
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}
