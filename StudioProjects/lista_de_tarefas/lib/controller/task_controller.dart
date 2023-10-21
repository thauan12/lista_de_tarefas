import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:lista_de_tarefas/model/task.dart' as MyTask;

class TaskController {
  final FirebaseStorage _storage = FirebaseStorage.instance;

  Future<void> addTask(
      List<MyTask.Task> tasks,
      String nome,
      String descricao,
      DateTime dataVencimento,
      ) async {
    try {
      final newTask = MyTask.Task(
        id: UniqueKey().toString(),
        nome: nome,
        descricao: descricao,
        dataVencimento: dataVencimento,
      );

      tasks.add(newTask);
    } catch (error) {
      print('Erro ao adicionar tarefa: $error');
    }
  }

  void editTask(
      MyTask.Task task,
      String nome,
      String descricao,
      DateTime dataVencimento,
      ) {
    try {
      task.nome = nome;
      task.descricao = descricao;
      task.dataVencimento = dataVencimento;
    } catch (error) {
      print('Erro ao editar tarefa: $error');
    }
  }

  void deleteTask(List<MyTask.Task> tasks, MyTask.Task task) { // Use o prefixo MyTask para a classe Task
    try {
      // Remova a tarefa da lista
      tasks.remove(task);
    } catch (error) {
      print('Erro ao excluir tarefa: $error');
    }
  }

  List<MyTask.Task> getCompletedTasks(List<MyTask.Task> allTasks) {
    return allTasks.where((task) => task.concluida).toList();
  }

  // Função para buscar tarefas não concluídas (concluida = false)
  List<MyTask.Task> getIncompleteTasks(List<MyTask.Task> allTasks) {
    return allTasks.where((task) => !task.concluida).toList();
  }

}
