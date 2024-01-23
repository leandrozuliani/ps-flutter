import 'package:entregaudium/models/entregador.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class EntregadorService {
  Future<Entregador> fetchProfile() async {
    final response = await http.get(Uri.parse('https://dbgapi-gamadev.taximachine.com.br/ps/perfil.php'));

    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body);
      if (jsonResponse['success'] == 'true') {
        var responseData = jsonResponse['response'];
        List<HistoricoEntrega> historico = (responseData['historico'] as List)
            .map((e) => HistoricoEntrega(
                  quando: e['quando'],
                  valor: e['valor'].toDouble(),
                  qtd: e['qtd'],
                  avaliacao: e['avaliacao'],
                ))
            .toList();
        return Entregador(
          nome: responseData['nome'],
          cargo: responseData['cargo'],
          descricao: responseData['descricao'],
          historico: historico,
        );
      } else {
        throw Exception('Falha ao carregar dados do servidor');
      }
    } else {
      throw Exception('Falha ao carregar dados do servidor');
    }
  }
}
