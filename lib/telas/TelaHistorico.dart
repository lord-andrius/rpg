import 'package:flutter/material.dart';
import 'package:sorteador/dados/dadosFalsos.dart';
import 'package:sorteador/widgets/WidgetItemHistorico.dart';

class TelaHistorico extends StatelessWidget {
  const TelaHistorico({super.key});

  @override
  Widget build(BuildContext contexto) {
    return  MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Histórico"),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(contexto);
            }
          ),
        ),
        body: Column(
            children: List<WidgetItemHistorico>.generate(
              historico.length,
              (int indice) {
                print(indice);
                if (indice % 2 == 0) {
                  return WidgetItemHistorico(historico[indice], Colors.purple.shade50);
                } else {
                  return WidgetItemHistorico(historico[indice], Colors.purple.shade100);
                }
              }
            ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: 1,
          onTap: (indice) {
            if (indice == 0) {
              Navigator.pop(contexto);
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
    );
  }
}
