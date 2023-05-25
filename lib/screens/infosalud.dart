import 'package:flutter/cupertino.dart';

class InfoSalud {
  int frecuenciaCardiaca; //número de contracciones del corazón o de pulsaciones por unidad de tiempo.
  String conclusionFrecuencia;
  double temperaturaCorporal; //sin grafico
  String conclusionTemperatura;
  int nivelCortisol;
  String conclusionCortisol;
  String calidadSueno; //sin grafico
  List<int> tiempoActividad; //grafica
  String estadoAnimo;
  String conclusionActividad;

  InfoSalud(
      {this.frecuenciaCardiaca = 80,
      this.conclusionFrecuencia = 'Normal',
      this.temperaturaCorporal = 38.5,
      this.conclusionTemperatura = 'Normal',
      this.nivelCortisol = 1,
      this.conclusionCortisol = 'Normal',
      this.calidadSueno = '',
      this.estadoAnimo = '',
      required this.tiempoActividad,
      required this.conclusionActividad});

  void incrementarFrecuenciaCardiaca(int incremento) {
    frecuenciaCardiaca += incremento;
  }
}
