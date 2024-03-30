class Task {
  int? id;
  String title;
  String dataInit;
  String description;

  Task({
    this.id,
    required this.description,
    required this.dataInit,
    required this.title,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': title,
         'description': description,
            'data_init': dataInit,
    };
  }

  static Task fromMap(Map<String, dynamic> map) {
    return Task(
      id: map['id'] ?? "",
      title: map['name'] ?? "",
    );
  }
}
