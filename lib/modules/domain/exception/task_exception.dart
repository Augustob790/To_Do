class TaskException implements Exception {
  final String message;

  TaskException({required this.message});

  TaskException.generic()
      : message = 'Não foi possivel acessar o banco de dados.';
}
