import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../controller/task_controller.dart';
import '../../model/task.dart' as MyTask;


class TarefaDetalhePage extends StatefulWidget {
  final MyTask.Task task;

  TarefaDetalhePage({required this.task});

  @override
  _TarefaDetalhePageState createState() => _TarefaDetalhePageState();
}

class _TarefaDetalhePageState extends State<TarefaDetalhePage> {
  TextEditingController nomeController = TextEditingController();
  TextEditingController descricaoController = TextEditingController();

  @override
  void initState() {
    super.initState();
    nomeController.text = widget.task.nome;
    descricaoController.text = widget.task.descricao;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalhes da Tarefa'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Nome da Tarefa:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextField(
              controller: nomeController,
            ),
            SizedBox(height: 16),
            Text(
              'Descrição:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextField(
              controller: descricaoController,
              maxLines: 5,
            ),
            SizedBox(height: 16),
            Text(
              'Prazo: ${DateFormat('dd/MM/yyyy').format(widget.task.dataVencimento.toLocal())}',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () {
                    // Implementar a função de edição aqui
                    final updatedTask = MyTask.Task(
                      id: widget.task.id, // Use o mesmo ID da tarefa existente
                      nome: nomeController.text,
                      descricao: descricaoController.text,
                      dataVencimento: widget.task.dataVencimento, // Mantenha a mesma data de vencimento
                      concluida: widget.task.concluida, // Mantenha o valor anterior
                    );

                    TaskController().editTask(updatedTask); // Atualize a tarefa com os novos dados
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text('Tarefa atualizada com sucesso.'),
                    ));
                  },
                ),
                IconButton(
                  icon: Icon(Icons.check),
                  onPressed: () {
                    // Implementar a função de edição aqui
                    final updatedTask = MyTask.Task(
                      id: widget.task.id, // Use o mesmo ID da tarefa existente
                      nome: nomeController.text,
                      descricao: descricaoController.text,
                      dataVencimento: widget.task.dataVencimento, // Mantenha a mesma data de vencimento
                      concluida: widget.task.concluida, // Mantenha o valor anterior
                    );

                    TaskController().editTask(updatedTask); // Atualize a tarefa com os novos dados
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text('Tarefa Concluida'),
                    ));
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
