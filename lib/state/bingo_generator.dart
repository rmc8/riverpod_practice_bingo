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
    final totalCells = _size * _size;

    // 1から99までの数字を使用（標準的なビンゴの範囲）
    final availableNumbers = List.generate(99, (index) => index + 1);
    availableNumbers.shuffle(random);

    // 必要な数だけ取り出す（中央のワイルドカード分を除く）
    _numbers = availableNumbers.take(totalCells - 1).toList();

    // ワイルドカードを追加
    _numbers.add(-1);

    // 中央にワイルドカードを配置
    final centerIndex = _numbers.length ~/ 2;
    final temp = _numbers[centerIndex];
    _numbers[centerIndex] = -1;
    _numbers[_numbers.length - 1] = temp;
  }
}
