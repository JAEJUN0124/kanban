enum KanbanStatus { todo, progress, done }

extension KanbanStatusExtension on KanbanStatus {
  String get label => switch (this) {
    KanbanStatus.todo => 'To-do',
    KanbanStatus.progress => 'In progress',
    KanbanStatus.done => 'Done',
  };
}