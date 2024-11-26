import 'package:advertising_id/advertising_id.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';

import '../../../../../routes/route_value.dart';
import '../../../../core/utils/app_icon.dart';
import '../../../../core/utils/icon_provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    startLoading(context);
  }

  Future<void> startLoading(BuildContext context) async {
    await Future.delayed(const Duration(milliseconds: 1000));

    final adId = await AdvertisingId.id(true);
    context.go(RouteValue.home.path);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Stack(
      alignment: Alignment.center,
      children: [
        Positioned.fill(
          child: AppIcon(
            asset: IconProvider.splash.buildImageUrl(),
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          top: height * 0.168,
          left: -(width * 0.041),
          child: AppIcon(
            asset: IconProvider.splashItem.buildImageUrl(),
            width: width * 0.988,
            fit: BoxFit.fitWidth,
          ),
        ),
        Positioned(
          bottom: height * 0.218,
          left: width * 0.041,
          child: const SizedBox(
            width: 310,
            child: Text(
              'Quantum AI Tracker',
              style: TextStyle(
                color: Colors.black,
                fontSize: 64,
                fontFamily: 'cygre-book',
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ),
        Positioned(
          bottom: height * 0.0475,
          width: width * 0.9,
          child: LinearProgressIndicator(
            minHeight: 19,
            borderRadius: BorderRadius.circular(10),
            color: const Color(0xFF3764F3),
            backgroundColor: const Color(0xFF202020),
          ),
        ),
      ],
    );
  }
}
