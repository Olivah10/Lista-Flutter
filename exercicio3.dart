import 'package:flutter/material.dart';

void main() {
  runApp(const MeuApp());
}

class Aluno {
  String nome;
  double nota;

  Aluno(this.nome, this.nota);
}

class MeuApp extends StatelessWidget {
  const MeuApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TelaAlunos(),
    );
  }
}

class TelaAlunos extends StatelessWidget {
  TelaAlunos({super.key});

  final alunos = [
    Aluno('Ana Souza', 8.5),
    Aluno('Bruno Lima', 6.0),
    Aluno('Carla Melo', 9.2),
    Aluno('Diego Alves', 4.7),
    Aluno('Elisa Rocha', 7.8),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Lista de Alunos')),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: alunos.length,
        itemBuilder: (context, index) {
          final aluno = alunos[index];

          return Card(
            child: ListTile(
              leading: const Icon(Icons.person),
              title: Text(aluno.nome),
              subtitle: Text('Nota: ${aluno.nota.toStringAsFixed(1)}'),
            ),
          );
        },
      ),
    );
  }
}
