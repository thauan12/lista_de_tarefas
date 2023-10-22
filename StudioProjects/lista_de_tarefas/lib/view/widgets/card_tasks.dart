import 'package:flutter/material.dart';
import 'package:lista_de_tarefas/model/task.dart' as MyTask;
import 'package:intl/intl.dart';

import '../pages/detalheTarefa.dart';

class CardTasks extends StatelessWidget {
  final MyTask.Task task;

  const CardTasks({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:(){
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => TarefaDetalhePage(task: task), ));
    },
      child: Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(15),
        color: const Color.fromRGBO(240,230,140, 0.4),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            task.nome,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            task.descricao,
            style: const TextStyle(fontSize: 16),
          ),
          const SizedBox(
            height: 8,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                'Prazo: ${DateFormat('dd/MM/yyyy').format(task.dataVencimento.toLocal())}',
                style: const TextStyle(fontSize: 16),
              ),
            ],
          ),
        ],
      ),
      ),
    );
  }
}
