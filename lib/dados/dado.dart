enum TipoDados {
  D4,
  D6,
  D8,
  D10,
  D10Dezena,
  D12,
  D20,

 
}

int maximoDoDado(TipoDados tipoDado) {
   switch (tipoDado) {
      case TipoDados.D4:
        return 4;
      case TipoDados.D6:
        return 6;
      case TipoDados.D8:
        return 8;
      case TipoDados.D10:
      case TipoDados.D10Dezena:
        return 10;
      case TipoDados.D12:
        return 12;
      case TipoDados.D20:
        return 20;
    }
}

String stringDoDado(TipoDados tipoDado) {
   switch (tipoDado) {
      case TipoDados.D4:
        return "D4";
      case TipoDados.D6:
        return "D6";
      case TipoDados.D8:
        return "D8";
      case TipoDados.D10:
        return "D10";
      case TipoDados.D10Dezena:
        return "D10(DEZENA)";
      case TipoDados.D12:
        return "D12";
      case TipoDados.D20:
        return "D20";
    }
}

TipoDados avancar(TipoDados tipoDado) {
  switch (tipoDado) {
      case TipoDados.D4:
        return TipoDados.D6;
      case TipoDados.D6:
        return TipoDados.D8;
      case TipoDados.D8:
        return TipoDados.D10;
      case TipoDados.D10:
        return TipoDados.D10Dezena;
      case TipoDados.D10Dezena:
        return TipoDados.D12;
      case TipoDados.D12:
        return TipoDados.D20;
      case TipoDados.D20:
        return TipoDados.D4;
    }
}

TipoDados retroceder(TipoDados tipoDado) {
  switch (tipoDado) {
      case TipoDados.D4:
        return TipoDados.D20;
      case TipoDados.D6:
        return TipoDados.D4;
      case TipoDados.D8:
        return TipoDados.D6;
      case TipoDados.D10:
        return TipoDados.D8;
      case TipoDados.D10Dezena:
        return TipoDados.D10;
      case TipoDados.D12:
        return TipoDados.D10Dezena;
      case TipoDados.D20:
        return TipoDados.D12;
    }
}