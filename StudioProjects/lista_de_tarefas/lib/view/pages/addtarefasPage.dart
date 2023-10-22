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
        backgroundColor: const Color.fromRGBO(240, 230, 140, 0.4),
      ),
      body: Container(
        color: const Color.fromRGBO(240, 230, 140, 0.4),
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, // Define o alinhamento à esquerda
          children: [
            Text(
              'Tarefa *',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,

              ),
            ),
            TextField(
              controller: nomeController,
              decoration: InputDecoration(
                hintText: 'Digite o nome da tarefa',
              ),
            ),
            SizedBox(height: 30),
            Text(
              'Descrição *',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 15),
            TextField(
              controller: descricaoController,
              maxLines: 5,
              decoration: InputDecoration(
                hintText: 'Descrição da tarefa',
                contentPadding: EdgeInsets.all(16.0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
            SizedBox(height: 15), // Adicione um espaço entre os campos
            ListTile(
              title: Text(
                'Prazo: ${dataVencimento != null ? dataVencimento.toString().split(' ')[0] : "Selecione a data"}',
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
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: ElevatedButton(
                  onPressed: () {
                    if (nomeController.text.isNotEmpty &&
                        descricaoController.text.isNotEmpty) {
                      final taskController = TaskController();
                      taskController.addTask(
                        widget.tasks,
                        nomeController.text,
                        descricaoController.text,
                        dataVencimento ?? DateTime.now(),
                      );
                      Navigator.of(context).pop();
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Por favor, preencha todos os campos obrigatórios.'),
                        ),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(200, 50),
                    textStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
                  ),
                  child: Text('Adicionar Tarefa'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
