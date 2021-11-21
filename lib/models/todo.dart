class Todo {
  int id;
  String title;
  String desc;
  DateTime createdAt;
  DateTime? completedAt;

  Todo(this.id, this.title, this.desc, this.createdAt);

  void markAsCompleted() {
    completedAt = DateTime.now();
  }
}
