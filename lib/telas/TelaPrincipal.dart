import 'package:flutter/material.dart';
import 'package:sorteador/widgets/dado.dart';
import 'package:sorteador/telas/TelaHistorico.dart';

class TelaPrincipal extends StatelessWidget {
	const TelaPrincipal({super.key});

	@override
	Widget build(BuildContext contexto) {
		return  MaterialApp(
			home: Builder(
          builder: (contexto) => Scaffold(
				appBar: AppBar(
					title: const Text("Dados"),
				),
        body: Dados(),
        bottomNavigationBar: BottomNavigationBar(
          onTap: (indice) {
            if(indice > 0) {
              Navigator.push<void>(
                contexto,
                MaterialPageRoute<void>(
                  builder: (BuildContext contexto) => TelaHistorico(),
                ),
              );
            }
          },
          items: const [
            BottomNavigationBarItem(
              icon:  Icon(Icons.home),
              label: "Dados",
            ),
            BottomNavigationBarItem(
              icon:  Icon(Icons.history),
              label: "Histórico",
            ),
          ],
        ),
			),
		),
    );
	}
}
