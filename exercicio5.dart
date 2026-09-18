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
      home: TelaEstoque(),
    );
  }
}

class TelaEstoque extends StatefulWidget {
  TelaEstoque({super.key});

  @override
  State<TelaEstoque> createState() => _TelaEstoqueState();
}

class _TelaEstoqueState extends State<TelaEstoque> {
  final nome = TextEditingController();
  final preco = TextEditingController();
  final quantidade = TextEditingController();

  final produtos = <Produto>[];

  void adicionar() {
    final nomeProduto = nome.text.trim();
    final valor = double.tryParse(preco.text) ?? 0;
    final qtd = int.tryParse(quantidade.text) ?? 0;

    if (nomeProduto.isEmpty || valor <= 0 || qtd <= 0) {
      return;
    }

    setState(() {
      produtos.add(Produto(nomeProduto, valor, qtd));
    });

    limpar();
  }

  void excluir(int index) {
    setState(() {
      produtos.removeAt(index);
    });
  }

  void limpar() {
    nome.clear();
    preco.clear();
    quantidade.clear();
  }

  @override
  void dispose() {
    nome.dispose();
    preco.dispose();
    quantidade.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Estoque')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: nome,
              decoration: const InputDecoration(
                labelText: 'Nome do produto',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: preco,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Preço',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: quantidade,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Quantidade',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: adicionar,
                  child: const Text('Adicionar'),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: limpar,
                  child: const Text('Limpar'),
                ),
              ],
            ),
            const SizedBox(height: 15),
            Expanded(
              child: produtos.isEmpty
                  ? const Center(child: Text('Nenhum produto cadastrado.'))
                  : ListView.builder(
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
                            trailing: IconButton(
                              onPressed: () => excluir(index),
                              icon: const Icon(Icons.delete),
                            ),
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
