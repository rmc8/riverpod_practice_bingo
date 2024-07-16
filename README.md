# Riverpod Practice Bingo

\[English follows Japanese]

このプロジェクトは、Riverpodを使用して状態管理を行うビンゴゲームのFlutterアプリケーションです。Riverpodを実際のアプリケーションで使用する方法の実践的な例として機能します。

## 機能

- 動的なビンゴカード生成
- 調整可能なカードサイズ（3x3、5x5、7x7、9x9）
- ビンゴセルのランダムな数字生成
- 中央のセルをワイルドカード（星アイコン）として設定
- 新しいカードを生成する機能

## 実行方法

このプロジェクトを実行するには：

1. マシンにFlutterがインストールされていることを確認してください
2. このリポジトリをクローンしてください
3. `flutter pub get` を実行して依存関係をインストールしてください
4. `flutter run` を実行してアプリケーションを起動してください

## プロジェクト構造

- `lib/main.dart`: アプリケーションのエントリーポイント
- `lib/bingo.dart`: BingoCardウィジェットを含む
- `lib/state/bingo_generator.dart`: 状態管理のためのBingoGeneratorクラスを含む
- `test/bingo_generator_test.dart`: BingoGeneratorのユニットテスト

## 状態管理

このプロジェクトでは、状態管理にRiverpodを使用しています。`BingoGenerator`クラスは`@riverpod`
でアノテーションされ、自動生成される`_$BingoGenerator`を継承しています。

## テスト

BingoGeneratorの正しい機能を確認するためのユニットテストが含まれています。以下のコマンドでテストを実行できます：

```
flutter test
```

## 継続的インテグレーション

このプロジェクトは継続的インテグレーションにCircleCIを使用しています。設定は`.circleci/config.yml`
にあります。

## ライセンス

このプロジェクトはオープンソースで、[MITライセンス](LICENSE)の下で利用可能です。

---

[English]

This project is a Flutter application that implements a Bingo game using Riverpod for state
management. It serves as a practical example of how to use Riverpod in a real-world application.

## Features

- Dynamic Bingo card generation
- Adjustable card size (3x3, 5x5, 7x7, 9x9)
- Random number generation for Bingo cells
- Center cell as a wildcard (star icon)
- Ability to generate a new card

## Getting Started

To run this project:

1. Ensure you have Flutter installed on your machine
2. Clone this repository
3. Run `flutter pub get` to install dependencies
4. Run `flutter run` to start the application

## Project Structure

- `lib/main.dart`: Entry point of the application
- `lib/bingo.dart`: Contains the BingoCard widget
- `lib/state/bingo_generator.dart`: Contains the BingoGenerator class for state management
- `test/bingo_generator_test.dart`: Unit tests for the BingoGenerator

## State Management

This project uses Riverpod for state management. The `BingoGenerator` class is annotated
with `@riverpod` and extends `_$BingoGenerator`, which is auto-generated.

## Testing

Unit tests are included to ensure the correct functionality of the BingoGenerator. Run tests using:

```
flutter test
```

## Continuous Integration

This project uses CircleCI for continuous integration. The configuration can be found
in `.circleci/config.yml`.

## License

This project is open source and available under the [MIT License](LICENSE).
