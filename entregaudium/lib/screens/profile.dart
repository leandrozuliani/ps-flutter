import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.topCenter,
            child: Image.asset(
              'assets/images/img_entregador.png',
              fit: BoxFit.fitHeight,
            ),
          ),
          Expanded(
            child: Container(
              color: const Color(0xCC2B76C9),
              padding:
                  const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(
                    'Augusto Prado',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontFamily: 'OpenSans',
                    ),
                  ),
                  Text(
                    'Coletor',
                    style: TextStyle(
                      color: Color(0xFFDFE9F7),
                      fontSize: 16,
                      fontFamily: 'OpenSansLight',
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 16.0),
                    child: Text(
                      'Casado, 2 filhos e moro no Rio de Janeiro. Comecei a fazer entregas durante a pandemia para ajudar os mais vulneráveis e hoje estou mais satisfeito sabendo que estou fazendo a minha parte! Obrigado por tudo!',
                      style: TextStyle(
                        color: Color(0xFFECF4FF),
                        fontSize: 15,
                        fontFamily: 'OpenSans',
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            color: const Color(0xFF2E91FE),
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Expanded(
                  // Usa Expanded para cada Column
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image.asset('assets/images/ic_entregas.png', width: 20),
                      const Text(
                        '254',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontFamily: 'Roboto',
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const Text(
                        'Entregas',
                        style: TextStyle(
                          color: Color(0xFFECF4FF),
                          fontSize: 13,
                          fontFamily: 'Roboto',
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image.asset('assets/images/ic_saldo.png', width: 20),
                      const Text(
                        'R\$ 33,50',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontFamily: 'Roboto',
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const Text(
                        'Saldo',
                        style: TextStyle(
                          color: Color(0xFFECF4FF),
                          fontSize: 13,
                          fontFamily: 'Roboto',
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image.asset('assets/images/ic_nota.png', width: 20),
                      const Text(
                        '4.7',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontFamily: 'Roboto',
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const Text(
                        'Nota',
                        style: TextStyle(
                          color: Color(0xFFECF4FF),
                          fontSize: 13,
                          fontFamily: 'Roboto',
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
