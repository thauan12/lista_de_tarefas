import 'package:flutter/material.dart';
import 'package:lista_de_tarefas/model/task.dart' as MyTask;
import 'package:lista_de_tarefas/controller/task_controller.dart';
import '../widgets/card_tasks.dart';
import 'addtarefasPage.dart';

class IncompleteTasksPage extends StatelessWidget {
  final List<MyTask.Task> tasks;

  IncompleteTasksPage({required this.tasks});

  @override
  Widget build(BuildContext context) {
    final taskController = TaskController();

    final incompleteTasks = taskController.getIncompleteTasks(tasks);

    void addTask() {
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => AddTarefaPage(
          tasks: tasks,
        ),
      ));
    }

    return Scaffold(
        body: Padding(
          padding: const EdgeInsets.fromLTRB(15, 20, 15, 20),
          child: ListView.builder(
                itemCount: incompleteTasks.length,
                itemBuilder: (context, index) {
          final task = incompleteTasks[index];
          return Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: CardTasks(task: task),
          );
                },
              ),
        ),
      floatingActionButton: FloatingActionButton(
        onPressed: addTask,
        child: Icon(Icons.add),
        ),
    );
  }
}
