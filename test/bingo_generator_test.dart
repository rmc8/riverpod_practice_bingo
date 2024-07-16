import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_practice_bingo/state/bingo_generator.dart';

void main() {
  group('BingoGenerator', () {
    test('初期状態のサイズが3であることを確認', () {
      final container = ProviderContainer();
      final bingoGenerator = container.read(bingoGeneratorProvider.notifier);
      expect(bingoGenerator.size, 3);
    });

    test('サイズが正しく設定されることを確認', () {
      final container = ProviderContainer();
      final bingoGenerator = container.read(bingoGeneratorProvider.notifier);
      bingoGenerator.setSize(5);
      expect(bingoGenerator.size, 5);
    });

    test('無効なサイズが設定されないことを確認', () {
      final container = ProviderContainer();
      final bingoGenerator = container.read(bingoGeneratorProvider.notifier);
      bingoGenerator.setSize(4); // 無効なサイズ
      expect(bingoGenerator.size, 3); // 変更されない
    });

    test('新しいカードが生成されることを確認', () {
      final container = ProviderContainer();
      final bingoGenerator = container.read(bingoGeneratorProvider.notifier);
      final initialNumbers = container.read(bingoGeneratorProvider);
      bingoGenerator.generateNewCard();
      final newNumbers = container.read(bingoGeneratorProvider);
      expect(initialNumbers, isNot(newNumbers)); // 新しい数字が生成されている
    });

    test('中央の数字が-1であることを確認', () {
      final container = ProviderContainer();
      final bingoNumbers = container.read(bingoGeneratorProvider);
      final centerIndex = bingoNumbers.length ~/ 2;
      expect(bingoNumbers[centerIndex], -1);
    });
  });

  test('生成されたカードの番号に重複がないことを確認', () {
    final container = ProviderContainer();
    final bingoGenerator = container.read(bingoGeneratorProvider.notifier);

    // サイズを9に設定
    bingoGenerator.setSize(9);

    // 30回カードを生成してチェック
    for (int i = 0; i < 30; i++) {
      bingoGenerator.generateNewCard();
      final numbers = container.read(bingoGeneratorProvider);

      // 重複チェック
      final uniqueNumbers = numbers.toSet();
      expect(uniqueNumbers.length, numbers.length,
          reason: '重複する番号があります。生成されたカード: $numbers');

      // 範囲チェック
      expect(
          numbers.where((n) => n >= 0 && n <= 100).length, numbers.length - 1,
          reason: '範囲外の番号があります。生成されたカード: $numbers');

      // ワイルドカードチェック
      expect(numbers.where((n) => n == -1).length, 1,
          reason: 'ワイルドカードの数が正しくありません。生成されたカード: $numbers');

      // 中央のセルがワイルドカードであることを確認
      final centerIndex = numbers.length ~/ 2;
      expect(numbers[centerIndex], -1,
          reason: '中央のセルがワイルドカードではありません。生成されたカード: $numbers');
    }
  });
}
