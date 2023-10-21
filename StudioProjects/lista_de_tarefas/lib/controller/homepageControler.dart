import 'package:flutter/material.dart';
import 'package:lista_de_tarefas/view/pages/task_completadas.dart';
import 'package:lista_de_tarefas/view/pages/tarefasincompletasPage.dart';
import '../model/task.dart' as MyTask;

final List<MyTask.Task> tasks = [];

class HomeViewModel {
  Widget buildPage(int index) {
    switch (index) {
      case 0:
        return IncompleteTasksPage(tasks: tasks);
      case 1:
        return CompletedTasksPage(tasks: tasks);
      default:
        return Container();
    }
  }
}
