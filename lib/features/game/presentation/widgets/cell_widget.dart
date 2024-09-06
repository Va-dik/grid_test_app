import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grid_test_app/features/game/data/models/cell_model.dart';
import 'package:grid_test_app/features/game/data/repositories/game_repository.dart';

class CellWidget extends StatefulWidget {
  final CellModel cell;
  final void Function() onTap;
  final GameRepository gameRepository;

  const CellWidget({
    super.key,
    required this.cell,
    required this.onTap,
    required this.gameRepository,
  });

  @override
  State<CellWidget> createState() => _CellWidgetState();
}

class _CellWidgetState extends State<CellWidget> {
  final BorderRadius borderRadius = const BorderRadius.all(Radius.circular(12));

  double opacity = 1;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 3),
      decoration: BoxDecoration(
        color: widget.cell.bottomColor,
        borderRadius: borderRadius,
      ),
      child: GestureDetector(
        onTap: () {
          setState(() => opacity = 0.3);
          widget.onTap();
        },
        child: AnimatedOpacity(
          duration: const Duration(milliseconds: 100),
          opacity: opacity,
          onEnd: () => setState(() => opacity = 1),
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
              gradient: RadialGradient(
                center: const Alignment(0, 0),
                radius: 0.56,
                colors: widget.cell.gradient,
                stops: const <double>[0, 1],
              ),
            ),
            child: Text(
              '${widget.cell.number}',
              style: GoogleFonts.getFont(
                'Share',
                fontWeight: FontWeight.w700,
                fontSize: widget.gameRepository.cellCount == 16
                    ? 60
                    : widget.gameRepository.cellCount == 25
                        ? 40
                        : 30,
                height: 1,
                letterSpacing: -0.9,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
