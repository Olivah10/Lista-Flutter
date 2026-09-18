import 'package:flutter/material.dart';

void main() {
  runApp(const MeuApp());
}

class Livro {
  String titulo;
  String autor;

  Livro(this.titulo, this.autor);
}

class MeuApp extends StatelessWidget {
  const MeuApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TelaLivros(),
    );
  }
}

class TelaLivros extends StatelessWidget {
  TelaLivros({super.key});

  final livros = [
    Livro('Dom Casmurro', 'Machado de Assis'),
    Livro('1984', 'George Orwell'),
    Livro('O Cortiço', 'Aluísio Azevedo'),
    Livro('A Revolução dos Bichos', 'George Orwell'),
    Livro('Clean Code', 'Robert C. Martin'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Catálogo de Livros')),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: livros.length,
        itemBuilder: (context, index) {
          final livro = livros[index];

          return Card(
            child: ListTile(
              leading: const Icon(Icons.menu_book),
              title: Text(livro.titulo),
              subtitle: Text('Autor: ${livro.autor}'),
            ),
          );
        },
      ),
    );
  }
}
