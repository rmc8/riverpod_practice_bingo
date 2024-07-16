import 'dart:math';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'bingo_generator.g.dart';

@riverpod
class BingoGenerator extends _$BingoGenerator {
  int _size = 3;
  late List<int> _numbers;

  @override
  List<int> build() {
    _generateNumbers();
    return _numbers;
  }

  int get size => _size;

  void setSize(int newSize) {
    if (newSize >= 3 && newSize <= 9 && newSize % 2 != 0) {
      _size = newSize;
      _generateNumbers();
      state = _numbers;
    }
  }

  void generateNewCard() {
    _generateNumbers();
    state = _numbers;
  }

  void _generateNumbers() {
    final random = Random();
    _numbers = List.generate(_size * _size, (_) => random.nextInt(101));
    final centerIndex = _numbers.length ~/ 2;
    _numbers[centerIndex] = -1;
  }
}
