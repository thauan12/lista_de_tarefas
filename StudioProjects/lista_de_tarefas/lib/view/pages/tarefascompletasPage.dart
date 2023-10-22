import 'package:flutter/material.dart';
import 'package:lista_de_tarefas/model/task.dart' as MyTask;
import 'package:lista_de_tarefas/controller/task_controller.dart';

class CompletedTasksPage extends StatelessWidget {
  final List<MyTask.Task> tasks;

  CompletedTasksPage({required this.tasks});

  @override
  Widget build(BuildContext context) {
    final taskController = TaskController();

    final completedTasks = taskController.getCompletedTasks(tasks);

    // Agora, você pode exibir a lista de tarefas concluídas no seu widget
    return ListView.builder(
      itemCount: completedTasks.length,
      itemBuilder: (context, index) {
        final task = completedTasks[index];
        // Exiba a tarefa concluída
        return ListTile(
          title: Text(task.nome),
          subtitle: Text(task.descricao),
          // Adicione mais detalhes da tarefa, se desejar
        );
      },
    );
  }
}
