import 'package:flutter/material.dart';
import 'package:lista_de_tarefas/model/task.dart' as MyTask;
import 'package:lista_de_tarefas/controller/task_controller.dart';

class AddTarefaPage extends StatefulWidget {
  final List<MyTask.Task> tasks;

  AddTarefaPage({required this.tasks});

  @override
  _AddTarefaPageState createState() => _AddTarefaPageState();
}

class _AddTarefaPageState extends State<AddTarefaPage> {
  final TextEditingController nomeController = TextEditingController();
  final TextEditingController descricaoController = TextEditingController();
  DateTime? dataVencimento;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Adicionar Tarefa'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: nomeController,
              decoration: InputDecoration(labelText: 'Nome da Tarefa'),
            ),
            TextField(
              controller: descricaoController,
              decoration: InputDecoration(labelText: 'Descrição'),
            ),
            ListTile(
              title: Text(
                'Data de Vencimento: ${dataVencimento != null ? dataVencimento.toString().split(' ')[0] : "Selecione a data"}',
              ),
              trailing: IconButton(
                icon: Icon(Icons.calendar_today),
                onPressed: () async {
                  final selectedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime.now(),
                    lastDate: DateTime(2101),
                  );

                  if (selectedDate != null) {
                    setState(() {
                      dataVencimento = selectedDate;
                    });
                  }
                },
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Adicione a lógica para criar a nova tarefa aqui
                final taskController = TaskController();
                taskController.addTask(
                  widget.tasks,
                  nomeController.text,
                  descricaoController.text,
                  dataVencimento ?? DateTime.now(),
                );
                // Após adicionar a tarefa, você pode retornar à tela anterior
                Navigator.of(context).pop();
              },
              child: Text('Adicionar Tarefa'),
            ),
          ],
        ),
      ),
    );
  }
}
