import 'package:flutter/material.dart';
import 'package:grid_test_app/features/game/presentation/widgets/restart_button.dart';
import 'package:grid_test_app/features/game/presentation/widgets/timer_widget.dart';

class BottomPanel extends StatelessWidget {
  const BottomPanel({
    super.key,
    required this.timeSeconds,
    required this.onPressed,
  });
  final void Function() onPressed;
  final int timeSeconds;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Container(
      height: screenSize.height * 0.2,
      alignment: Alignment.topCenter,
      padding: const EdgeInsets.only(top: 32),
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/decorations/bottom_wall.png'),
          fit: BoxFit.fill,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          TimerWidget(seconds: timeSeconds),
          RestartButton(onPressed: onPressed),
        ],
      ),
    );
  }
}
