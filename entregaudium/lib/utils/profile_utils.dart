import 'package:entregaudium/models/entregador.dart';

class ProfileUtils {
  static int getTotalEntregas(List<HistoricoEntrega> historico) {
    return historico.fold(0, (total, entrega) => total + entrega.qtd);
  }

  static double getTotalGanhos(List<HistoricoEntrega> historico) {
    return historico.fold(0, (total, entrega) => total + entrega.valor);
  }

  static double getMediaAvaliacoes(List<HistoricoEntrega> historico) {
    if (historico.isEmpty) return 0;
    return historico.fold(
        0, (total, entrega) => total + (entrega.avaliacao) / historico.length);
  }
}
