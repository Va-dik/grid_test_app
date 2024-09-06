import 'package:flutter/material.dart';

class WallWidget extends StatelessWidget {
  const WallWidget({super.key});
  final BorderRadius borderRadius = const BorderRadius.all(Radius.circular(12));

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 3),
      decoration: BoxDecoration(
        color: const Color.fromRGBO(5, 113, 98, 1),
        borderRadius: borderRadius,
      ),
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          border: const Border(
            bottom: BorderSide(
              color: Color.fromRGBO(255, 255, 255, 0.4),
              width: 1.5,
            ),
          ),
          borderRadius: borderRadius,
          gradient: const RadialGradient(
            center: Alignment(0, 0),
            radius: 0.56,
            colors: [Color(0xFF57EED7), Color(0xFF10AD97)],
            stops: <double>[0, 1],
          ),
        ),
      ),
    );
  }
}
