import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_practice_bingo/bingo.dart';

void main() {
  runApp(
    ProviderScope(
      child: const BingoApp(),
    ),
  );
}

class BingoApp extends StatelessWidget {
  const BingoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Center(
            child: Text("Bingo Game"),
          ),
        ),
        body: Container(
          alignment: Alignment.center,
          child: BingoCard(),
        ),
      ),
    );
  }
}
