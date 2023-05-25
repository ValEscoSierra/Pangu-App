import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'tiempoActividadData.dart';

class BarChartWidget extends StatelessWidget {
  final List<charts.Series<TiempoActividadData, String>> seriesList;
  final bool animate;
  final chartStyle = charts.TextStyleSpec(
    fontSize: 12,
    fontFamily: 'Poppins', // Cambia el tipo de fuente según tus necesidades
  );

  BarChartWidget(this.seriesList, {required this.animate});

  @override
  Widget build(BuildContext context) {
    return charts.BarChart(
      seriesList,
      animate: animate,
      behaviors: [
        // Título del eje x
        charts.ChartTitle(
          'Horas',
          behaviorPosition: charts.BehaviorPosition.bottom,
          titleStyleSpec: charts.TextStyleSpec(
            fontSize: 12,
            fontFamily: 'Poppins', // Ajustar el tamaño de la letra aquí
          ),
        ),

        // Título del eje y
        charts.ChartTitle(
          'Tiempo de actividad (min)',
          behaviorPosition: charts.BehaviorPosition.start,
          titleStyleSpec: charts.TextStyleSpec(
              fontSize: 12,
              fontFamily: 'Poppins' // Ajustar el tamaño de la letra aquí
              ),
        ),
      ],
    );
  }
}
