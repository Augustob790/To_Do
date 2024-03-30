class Task {
  int? id;
  String title;
  String dataInit;
  String description;
  bool isDone;

  Task({
    this.id,
    required this.description,
    required this.dataInit,
    required this.title,
    this.isDone = false,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': title,
      'description': description,
      'date_init': dataInit,
      'is_done': isDone,
    };
  }

  static Task fromMap(Map<String, dynamic> map) {
    return Task(
      id: map['id'] ?? "",
      title: map['name'] ?? "",
      dataInit: map['date_init'] ?? "",
      description: map['description'] ?? "",
      isDone: map['is_done'] ?? false,
    );
  }
}
