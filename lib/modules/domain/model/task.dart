class Task {
  int? id;
  String title;

  Task({
    this.id,
    required this.title,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': title,
    };
  }

  static Task fromMap(Map<String, dynamic> map) {
    return Task(
      id: map['id'] ?? "",
      title: map['name'] ?? "",
    );
  }
}
