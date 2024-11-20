import 'dart:math';

import 'package:flutter/material.dart';
import 'package:sorteador/dados/dado.dart';
import 'package:sorteador/dados/dadosFalsos.dart';
import 'package:sorteador/modelos/ItemHistorico.dart';



class Dados extends StatefulWidget {
  const Dados({super.key});

  @override
  State<Dados> createState() => _EstadoDados(tipoDado: historico.last.tipoDados, numerosAntigos: historico.last.numerosGerados);
}

class _EstadoDados extends State<Dados> {
  late TipoDados tipoDado;
  late List<int> _numerosGerados;
  late int quantidade;
  String textoErroInput = "";
  final _gerador = Random();

  _EstadoDados({TipoDados? tipoDado, int? quantidade, List<int>? numerosAntigos}) {
    this.tipoDado = tipoDado ?? TipoDados.D4;
    this.quantidade = quantidade ?? 1;
    _numerosGerados = numerosAntigos ?? [];
  }
   
  

  gerar() {
    if(quantidade < 1 || quantidade > 10) {
      setState(() {
        textoErroInput = "*O número deve estar entre 1 e 10";
      });
      return;
    }

    List<int> numerosGerados = [];   
    for (var i = 0; i < quantidade; i++) {
      int numeroGerado =   _gerador.nextInt(maximoDoDado(tipoDado)) + 1;
      if(tipoDado == TipoDados.D10Dezena) {
        numeroGerado *= 10;
      }
      numerosGerados.add(numeroGerado);
    }
    _numerosGerados = numerosGerados;


  }

  @override
  Widget build(BuildContext contexto) {
    List<Widget> elementos = [
      Text(stringDoDado(tipoDado), textDirection: TextDirection.ltr),
      GestureDetector(
        onTap: (){
	setState(() {
              tipoDado = avancar(tipoDado);
          });
	},
        child: Image(image: AssetImage("assets/${stringDoDado(tipoDado)}.png"), width: 200,),
      )
    ];
    var stringNumerosGerados = _numerosGerados.toString();
    if(_numerosGerados.isNotEmpty) {
        elementos.add(
          Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(100)),
            child: Center(
                child: Text(stringNumerosGerados.substring(1,stringNumerosGerados.lastIndexOf("]")), style: const TextStyle(fontSize: 30,)),
              ),
            ),
        );
    }

    elementos.add(
      TextField(
        maxLength: 2,
        decoration: const InputDecoration(labelText: "Quantidade de lançamento dos dados:"),
        keyboardType: const TextInputType.numberWithOptions(signed: false),
        
        onChanged: (novoValor)  {
          if(novoValor.contains('.')) {
            setState(() {
              textoErroInput = "*Por favor digite um número inteiro";
            });
            return;
          }
          quantidade = int.tryParse(novoValor) ?? 0;

          if(novoValor.isEmpty) quantidade = 1;

          if(quantidade < 1 || quantidade > 10) {
            setState(() {
              textoErroInput = "*O número deve estar entre 1 e 10";
            });
            return;
          } else {
            textoErroInput = "";
          }
        },
      )
    );

    if(textoErroInput.isNotEmpty) {
      elementos.add(
        Text(textoErroInput, style: const TextStyle(color: Colors.red),),
      );
    }

    elementos.add(
      TextButton(
        
        onPressed: () {
          setState(() {
            gerar();
          });
        },
        
        child: const Text("Gerar"),
      )
    );


    return  Center(
      child: Column(
        children: elementos,
      ),
    );
  } 
}
