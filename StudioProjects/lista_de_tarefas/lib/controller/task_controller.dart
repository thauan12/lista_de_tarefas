import 'package:flutter/material.dart';
import 'package:lista_de_tarefas/model/task.dart' as MyTask;
import 'package:cloud_firestore/cloud_firestore.dart';

class TaskController {

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

      print('Novo Task: $newTask');

      final taskCollection = FirebaseFirestore.instance.collection('tasks');

      await taskCollection.add(newTask.toJson());

      tasks.add(newTask);
    } catch (error) {
      print('Erro ao adicionar tarefa: $error');
    }
  }

  Future<void> editTask(MyTask.Task updatedTask) async {
    try {
      final taskReference = FirebaseFirestore.instance.collection('tasks').doc(updatedTask.id);
      await taskReference.update(updatedTask.toJson()); // Atualiza a tarefa no Firebase Firestore
    } catch (error) {
      print('Erro ao editar tarefa: $error');
    }
  }

  Future<void> deleteTask(MyTask.Task task) async {
    try {
      final taskReference = FirebaseFirestore.instance.collection('tasks').doc(task.id);

      await taskReference.delete(); // Exclui a tarefa no Firebase Firestore
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
