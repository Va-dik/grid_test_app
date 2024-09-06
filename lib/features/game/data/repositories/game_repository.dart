import 'package:grid_test_app/features/game/data/models/cell_model.dart';

class GameRepository {
  List<CellModel> cells;

  GameRepository.easy()
      : cellCount = 16,
        crossAxisCount = 4,
        timer = 90,
        cells = List<CellModel>.generate(16, (index) => CellModel());

  GameRepository.medium()
      : cellCount = 25,
        crossAxisCount = 5,
        timer = 150,
        cells = List<CellModel>.generate(25, (index) => CellModel());

  GameRepository.hard()
      : cellCount = 36,
        crossAxisCount = 6,
        timer = 210,
        cells = List<CellModel>.generate(36, (index) => CellModel());

  final int cellCount;
  final int crossAxisCount;
  final int timer;
}
