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
      home: TelaDisciplinas(),
    );
  }
}

class TelaDisciplinas extends StatelessWidget {
  TelaDisciplinas({super.key});

  final disciplinas = [
    'Programação',
    'Banco de Dados',
    'Redes de Computadores',
    'Flutter',
    'Segurança da Informação',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Minhas Disciplinas')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: disciplinas.map((nome) {
          return Column(
            children: [
              Text(nome, style: const TextStyle(fontSize: 20)),
              const Divider(),
            ],
          );
        }).toList(),
      ),
    );
  }
}
