import 'package:flutter/material.dart';

void main() {
  runApp(const MeuApp());
}

class MeuApp extends StatelessWidget {
  const MeuApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TelaLinguagens(),
    );
  }
}

class TelaLinguagens extends StatelessWidget {
  TelaLinguagens({super.key});

  final linguagens = [
    'Dart',
    'Python',
    'Java',
    'Kotlin',
    'Swift',
    'JavaScript',
    'C#',
    'C++',
    'Go',
    'Rust',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Linguagens de Programação'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: linguagens.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: const Icon(Icons.code),
            title: Text(linguagens[index]),
          );
        },
      ),
    );
  }
}
