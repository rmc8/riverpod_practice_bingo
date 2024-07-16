import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_practice_bingo/state/bingo_generator.dart';

const double BingoContentsSize = 18.0;

class BingoCard extends ConsumerWidget {
  const BingoCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bingoNumbers = ref.watch(bingoGeneratorProvider);
    final bingoGenerator = ref.read(bingoGeneratorProvider.notifier);

    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          _buildSizeSelector(bingoGenerator),
          _buildBingoGrid(bingoNumbers, bingoGenerator.size),
          const SizedBox(height: 32.0),
          _buildNewCardButton(bingoGenerator),
        ],
      ),
    );
  }

  Widget _buildSizeSelector(BingoGenerator bingoGenerator) {
    return DropdownButton<int>(
      value: bingoGenerator.size,
      items: [3, 5, 7, 9].map(_buildDropdownMenuItem).toList(),
      onChanged: (int? newValue) {
        if (newValue != null) bingoGenerator.setSize(newValue);
      },
    );
  }

  DropdownMenuItem<int> _buildDropdownMenuItem(int value) {
    return DropdownMenuItem<int>(
      value: value,
      child: Text('カードサイズ: $value'),
    );
  }

  Widget _buildBingoGrid(List<int> bingoNumbers, int size) {
    return Container(
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
      ),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: size,
        ),
        itemCount: bingoNumbers.length,
        itemBuilder: (context, index) => _buildGridItem(bingoNumbers, index),
      ),
    );
  }

  Widget _buildGridItem(List<int> bingoNumbers, int index) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
      ),
      child: Center(
        child: bingoNumbers[index] == -1
            ? const Icon(Icons.star, color: Colors.yellow, size: BingoContentsSize)
            : Text(
          bingoNumbers[index].toString(),
          style: const TextStyle(fontSize: BingoContentsSize),
        ),
      ),
    );
  }

  Widget _buildNewCardButton(BingoGenerator bingoGenerator) {
    return ElevatedButton(
      onPressed: bingoGenerator.generateNewCard,
      child: const Text('新しいカードを作成'),
    );
  }
}
