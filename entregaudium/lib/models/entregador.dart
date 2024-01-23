class Entregador {
  final String nome;
  final String cargo;
  final String descricao;
  final List<HistoricoEntrega> historico;

  Entregador({
    required this.nome,
    required this.cargo,
    required this.descricao,
    required this.historico,
  });
}

class HistoricoEntrega {
  final String quando;
  final double valor;
  final int qtd;
  final int avaliacao;

  HistoricoEntrega({
    required this.quando,
    required this.valor,
    required this.qtd,
    required this.avaliacao,
  });
}
