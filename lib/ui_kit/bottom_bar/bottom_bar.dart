import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:quantum/src/core/utils/icon_provider.dart';

import '../../routes/route_value.dart';
import '../../src/core/utils/app_icon.dart';

class BottomBar extends StatefulWidget {
  final void Function(int) onTap;
  const BottomBar({super.key, required this.onTap});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: 43, horizontal: MediaQuery.of(context).size.width * 0.08),
      child: DecoratedBox(
        decoration: BoxDecoration(
            color: Color(0xFF0C0B08),
            borderRadius: BorderRadius.all(Radius.circular(40.5))),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 11),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildIconButton(
                index: 0,
                iconUrl: IconProvider.home.buildImageUrl(),
                onPressed: () {
                  context.go(RouteValue.home.path);
                  _onItemTapped(0);
                },
              ),
              _buildIconButton(
                index: 1,
                iconUrl: IconProvider.calc.buildImageUrl(),
                onPressed: () {
                  context.go(RouteValue.calc.path);
                  _onItemTapped(1);
                },
              ),
              _buildIconButton(
                index: 2,
                iconUrl: IconProvider.port.buildImageUrl(),
                onPressed: () {
                  context.go(RouteValue.portfolio.path);
                  _onItemTapped(2);
                },
              ),
              _buildIconButton(
                index: 3,
                iconUrl: IconProvider.tips.buildImageUrl(),
                onPressed: () {
                  context.go(RouteValue.tips.path);
                  _onItemTapped(3);
                },
              ),  
              _buildIconButton(
                index: 4,
                iconUrl: IconProvider.history.buildImageUrl(),
                onPressed: () {
                  context.go(RouteValue.history.path);
                  _onItemTapped(4);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
    widget.onTap(index);
  }

  Widget _buildIconButton({
    required int index,
    required String iconUrl,
    required VoidCallback onPressed,
  }) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.17,
      child: IconButton(
        onPressed: onPressed,
        icon: AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          transitionBuilder: (Widget child, Animation<double> animation) {
            return ScaleTransition(scale: animation, child: child);
          },
          child: DecoratedBox(
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: index == _currentIndex
                    ? Color(0xFF3764F3)
                    : Color.fromARGB(255, 32, 32, 32)),
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: AppIcon(
                key: ValueKey<int>(_currentIndex == index ? 1 : 0),
                asset: iconUrl,
                color:
                    index == _currentIndex ? Colors.white : Color(0xFFB5B5B5),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
