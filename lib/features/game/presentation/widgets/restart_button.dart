import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class RestartButton extends StatelessWidget {
  final VoidCallback? onPressed;

  const RestartButton({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 44,
      width: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        gradient: const RadialGradient(
          center: Alignment(0, 0),
          radius: 3,
          colors: [
            Color.fromRGBO(155, 214, 82, 1),
            Color.fromRGBO(86, 171, 47, 1)
          ],
          stops: [0, 1],
        ),
      ),
      child: ElevatedButton.icon(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
          ),
          label: Text(
            'Restart',
            style: GoogleFonts.getFont(
              'Share',
              fontWeight: FontWeight.w700,
              fontSize: 18,
              height: 1,
              letterSpacing: -0.5,
              color: const Color.fromRGBO(255, 255, 255, 1),
            ),
          ),
          icon: Padding(
            padding: const EdgeInsets.only(bottom: 5, right: 3),
            child: SvgPicture.asset(
              'assets/icons/restart_icon.svg',
              height: 24,
            ),
          )),
    );
  }
}
