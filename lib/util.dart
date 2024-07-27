import 'package:flutter/material.dart';

void calcular({
  required TextEditingController gasolinaController,
  required TextEditingController etanolController,
  required Function(String) onResultadoCalculado,
}) {
  double gasolina = double.tryParse(
          gasolinaController.text.replaceAll(RegExp(r'[^0-9.]'), '')) ??
      0;
  double etanol = double.tryParse(
          etanolController.text.replaceAll(RegExp(r'[^0-9.]'), '')) ??
      0;

  if (gasolina == 0 || etanol == 0) {
    onResultadoCalculado('Insira valores para os combustíveis');
    return;
  }

  double razao = etanol / gasolina;

  if (razao <= 0.7) {
    onResultadoCalculado('Abasteça com Etanol');
  } else {
    onResultadoCalculado('Abasteça com Gasolina');
  }
}
