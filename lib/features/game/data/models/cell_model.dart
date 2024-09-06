import 'dart:ui';

final class CellModel {
  CellModel({
    this.number = 1,
    this.bottomColor = const Color.fromRGBO(5, 113, 98, 1),
    this.gradient = const [
      Color.fromRGBO(151, 212, 80, 1),
      Color.fromRGBO(116, 189, 62, 1),
    ],
  }) {
    _initialColors();
  }

  final int number;
  List<Color> gradient;
  Color bottomColor;

  CellModel setCell({required CellModel cell}) {
    if (cell.number == 5) {
      return cell.copyWith(number: 1);
    }
    return cell.copyWith(number: cell.number + 1);
  }

  CellModel copyWith({
    int? number,
  }) {
    return CellModel(
      number: number ?? this.number,
    );
  }

  void _initialColors() {
    switch (number) {
      case 1:
        bottomColor = const Color.fromRGBO(5, 113, 98, 1);
        gradient = const [
          Color.fromRGBO(151, 212, 80, 1),
          Color.fromRGBO(116, 189, 62, 1),
        ];
        break;
      case 2:
        bottomColor = const Color.fromRGBO(0, 15, 110, 1);
        gradient = const [
          Color.fromRGBO(80, 122, 212, 1),
          Color.fromRGBO(62, 77, 189, 1)
        ];
        break;
      case 3:
        bottomColor = const Color.fromRGBO(71, 0, 110, 1);
        gradient = const [
          Color.fromRGBO(177, 55, 219, 1),
          Color.fromRGBO(134, 23, 171, 1)
        ];
        break;
      case 4:
        bottomColor = const Color.fromRGBO(154, 72, 0, 1);
        gradient = const [
          Color.fromRGBO(255, 170, 59, 1),
          Color.fromRGBO(255, 133, 49, 1)
        ];
        break;
      case 5:
        bottomColor = const Color.fromRGBO(135, 0, 0, 1);
        gradient = const [
          Color.fromRGBO(255, 59, 59, 1),
          Color.fromRGBO(255, 59, 59, 1)
        ];
        break;
    }
  }
}
