import 'package:flutter/material.dart';
import 'package:grid_test_app/features/game/data/models/cell_model.dart';
import 'package:grid_test_app/features/game/data/repositories/game_repository.dart';
import 'package:grid_test_app/features/game/presentation/widgets/bottom_panel.dart';
import 'package:grid_test_app/features/game/presentation/widgets/cell_widget.dart';
import 'package:grid_test_app/features/game/presentation/widgets/wall_widget.dart';

class GamePage extends StatefulWidget {
  const GamePage({super.key, required this.gameRepository});

  final GameRepository gameRepository;

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(screenSize.width, screenSize.height * 0.2),
        child: Image.asset(
          'assets/decorations/top_wall.png',
          fit: BoxFit.fill,
          height: screenSize.height * 0.2,
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(),
          GridView.builder(
            padding: const EdgeInsets.all(16),
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: widget.gameRepository.crossAxisCount,
              mainAxisSpacing: 16,
              crossAxisSpacing: 16,
            ),
            itemCount: widget.gameRepository.cellCount,
            itemBuilder: (context, index) {
              if (index == 0) return const SizedBox();
              if (index < widget.gameRepository.crossAxisCount ||
                  index % widget.gameRepository.crossAxisCount == 0) {
                return const WallWidget();
              } else {
                final List<CellModel> cells = widget.gameRepository.cells;
                return CellWidget(
                  gameRepository: widget.gameRepository,
                  cell: cells[index],
                  onTap: () {
                    setState(() {
                      cells[index] = cells[index].setCell(
                        cell: widget.gameRepository.cells[index],
                      );
                    });
                  },
                );
              }
            },
          ),
          BottomPanel(
              timeSeconds: widget.gameRepository.timer,
              onPressed: () {
                setState(() => widget.gameRepository.cells = List.generate(
                      widget.gameRepository.cellCount,
                      (index) => CellModel(),
                    ));
              }),
        ],
      ),
    );
  }
}
