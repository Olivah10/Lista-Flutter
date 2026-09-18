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
      home: TelaTarefas(),
    );
  }
}

class TelaTarefas extends StatefulWidget {
  TelaTarefas({super.key});

  @override
  State<TelaTarefas> createState() => _TelaTarefasState();
}

class _TelaTarefasState extends State<TelaTarefas> {
  final tarefa = TextEditingController();
  final tarefas = <String>[];

  void adicionar() {
    if (tarefa.text.trim().isEmpty) {
      return;
    }

    setState(() {
      tarefas.add(tarefa.text.trim());
    });

    tarefa.clear();
  }

  void excluir(int index) {
    setState(() {
      tarefas.removeAt(index);
    });
  }

  @override
  void dispose() {
    tarefa.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Minhas Tarefas')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: tarefa,
              decoration: const InputDecoration(
                labelText: 'Digite uma tarefa',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: adicionar,
              child: const Text('Adicionar tarefa'),
            ),
            const SizedBox(height: 15),
            Expanded(
              child: tarefas.isEmpty
                  ? const Center(child: Text('Nenhuma tarefa ainda.'))
                  : ListView.builder(
                      itemCount: tarefas.length,
                      itemBuilder: (context, index) {
                        return Card(
                          child: ListTile(
                            leading: const Icon(Icons.check_box_outline_blank),
                            title: Text(tarefas[index]),
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
