class Task {
  String id;
  String nome;
  String descricao;
  DateTime dataVencimento;
  bool concluida;

  Task({
    required this.id,
    required this.nome,
    required this.descricao,
    required this.dataVencimento,
    this.concluida = false,
  });

  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      id: json['id'],
      nome: json['nome'],
      descricao: json['descricao'],
      dataVencimento: DateTime.parse(json['dataVencimento']),
      concluida: json['concluída'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nome': nome,
      'descricao': descricao,
      'dataVencimento': dataVencimento.toIso8601String(),
      'concluída': concluida,
    };
  }
}