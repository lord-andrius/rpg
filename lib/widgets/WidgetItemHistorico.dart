import 'package:flutter/material.dart';
import 'package:sorteador/modelos/ItemHistorico.dart';
import 'package:sorteador/dados/dado.dart';

class WidgetItemHistorico extends StatelessWidget {
  ItemHistorico itemHistorico;
  Color cor;
  WidgetItemHistorico(this.itemHistorico, this.cor,{super.key});


  @override
  Widget build(BuildContext contexto) {
    return Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: cor,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: Column(
          children: [
            Text("Números Gerados: ${itemHistorico.numerosGerados.toString().substring(1, itemHistorico.numerosGerados.length - 1)}"),
            Text("Tipo dado: ${stringDoDado(itemHistorico.tipoDados)}"),
          ],
        ),
    );
  }
}
