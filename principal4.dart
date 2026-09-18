import 'package:flutter/material.dart';

void main() {
  runApp(const MeuApp());
}

class Produto {
  String nome;
  double preco;
  int quantidade;

  Produto(this.nome, this.preco, this.quantidade);
}

class MeuApp extends StatelessWidget {
  const MeuApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TelaProdutos(),
    );
  }
}

class TelaProdutos extends StatelessWidget {
  TelaProdutos({super.key});

  final produtos = [
    Produto('Teclado', 120.00, 5),
    Produto('Mouse', 80.00, 10),
    Produto('Monitor', 950.00, 3),
    Produto('Headset', 250.00, 7),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Produtos')),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: produtos.length,
        itemBuilder: (context, index) {
          final produto = produtos[index];

          return Card(
            child: ListTile(
              leading: const Icon(Icons.inventory_2),
              title: Text(produto.nome),
              subtitle: Text(
                'R\$ ${produto.preco.toStringAsFixed(2)} - Estoque: ${produto.quantidade}',
              ),
            ),
          );
        },
      ),
    );
  }
}
