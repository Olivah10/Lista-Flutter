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
      home: TelaCursos(),
    );
  }
}

class TelaCursos extends StatelessWidget {
  TelaCursos({super.key});

  final cursos = [
    'Flutter',
    'Python',
    'Java',
    'Banco de Dados',
    'Redes de Computadores',
    'Segurança da Informação',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cursos Disponíveis')),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: cursos.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              leading: const Icon(Icons.computer),
              title: Text(cursos[index]),
              subtitle: Text('Curso ${index + 1}'),
            ),
          );
        },
      ),
    );
  }
}
