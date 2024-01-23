import 'package:entregaudium/models/entregador.dart';
import 'package:entregaudium/services/entregador_service.dart';
import 'package:entregaudium/utils/profile_utils.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  final EntregadorService dataProvider = EntregadorService();

  ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder<Entregador>(
        future: dataProvider.fetchProfile(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return const Center(
                child: Text('Dados do entregador indisponíveis'));
          } else if (snapshot.hasData) {
            return buildUserProfile(context, snapshot.data!);
          } else {
            return const Center(
                child: Text('Dados do entregador indisponíveis'));
          }
        },
      ),
    );
  }

  Widget buildUserProfile(BuildContext context, Entregador entregador) {
    final totalEntregas = ProfileUtils.getTotalEntregas(entregador.historico);
    final totalGanhos = ProfileUtils.getTotalGanhos(entregador.historico);
    final mediaAvaliacoes =
        ProfileUtils.getMediaAvaliacoes(entregador.historico);

    return Stack(
      children: <Widget>[
        Stack(
          alignment: Alignment.topCenter,
          children: [
            Positioned(
              top: 0,
              child: Image.asset(
                'assets/images/img_entregador.png',
                fit: BoxFit.fitHeight,
                height: 450,
              ),
            ),
          ],
        ),
        Positioned(
          bottom: 100,
          left: 0,
          right: 0,
          child: Container(
            color: const Color(0xCC2B76C9).withOpacity(0.8),
            padding:
                const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(
                    entregador.nome,
                    style: Theme.of(context).textTheme.displayLarge,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Text(
                      entregador.cargo,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: Text(
                      entregador.descricao,
                      style: Theme.of(context).textTheme.bodyMedium,
                      textAlign: TextAlign.left,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
            color: const Color(0xFF2E91FE),
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border(
                        right: BorderSide(width: 1.0, color: Colors.white),
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Image.asset('assets/images/ic_entregas.png', width: 20),
                        Text(
                          '$totalEntregas',
                          style: Theme.of(context).textTheme.headlineMedium,
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          'Entregas',
                          style: Theme.of(context).textTheme.labelSmall,
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border(
                        right: BorderSide(width: 1.0, color: Colors.white),
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Image.asset('assets/images/ic_saldo.png', width: 20),
                        Text(
                          'R\$ ${totalGanhos.toStringAsFixed(2)}',
                          style: Theme.of(context).textTheme.headlineMedium,
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          'Saldo',
                          style: Theme.of(context).textTheme.labelSmall,
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image.asset('assets/images/ic_nota.png', width: 20),
                      Text(
                        '$mediaAvaliacoes',
                        style: Theme.of(context).textTheme.headlineMedium,
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        'Nota',
                        style: Theme.of(context).textTheme.labelSmall,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
