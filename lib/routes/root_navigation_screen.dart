import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:quantum/ui_kit/bottom_bar/bottom_bar.dart';

import '../src/core/utils/icon_provider.dart';

class RootNavigationScreen extends StatefulWidget {
  final StatefulNavigationShell navigationShell;

  const RootNavigationScreen({
    super.key,
    required this.navigationShell,
  });

  @override
  State<RootNavigationScreen> createState() => _RootNavigationScreenState();
}

class _RootNavigationScreenState extends State<RootNavigationScreen> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      resizeToAvoidBottomInset: false,
      child: Stack(
        children: [
          Positioned.fill(
            child: DecoratedBox(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    IconProvider.splash.buildImageUrl(),
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          widget.navigationShell,
          Positioned(
              bottom: 0,
              right: 0,
              left: 0,
              child: BottomBar(
                onTap: _onTap,
              )),
        ],
      ),
    );
  }

  void _onTap(int index) {
    currentIndex = index;
    widget.navigationShell.goBranch(
      index,
      initialLocation: true,
    );
  }
}
