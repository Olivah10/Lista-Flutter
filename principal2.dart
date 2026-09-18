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
    'Redes',
    'Segurança da Informação',
    'Inteligência Artificial',
    'Desenvolvimento Web',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cursos')),
      body: ListView.builder(
        itemCount: cursos.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: const Icon(Icons.school),
            title: Text(cursos[index]),
          );
        },
      ),
    );
  }
}
