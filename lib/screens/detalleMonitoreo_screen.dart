import 'package:flutter/material.dart';
import 'dog.dart';
import 'infosalud.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'tiempoActividadData.dart';
import 'barCharWidget.dart';

class DetalleMonitoreo_screen extends StatefulWidget {
  @override
  _DetalleMonitoreoScreenState createState() => _DetalleMonitoreoScreenState();
}

class _DetalleMonitoreoScreenState extends State<DetalleMonitoreo_screen> {
  InfoSalud infoSalud = InfoSalud(
      frecuenciaCardiaca: 80,
      conclusionFrecuencia: "Normal",
      temperaturaCorporal: 38.5,
      conclusionTemperatura: "Normal",
      nivelCortisol: 1,
      conclusionCortisol: "Normal",
      calidadSueno: "Buena",
      estadoAnimo: "Relajado",
      tiempoActividad: [30, 5, 60, 15, 45, 10],
      conclusionActividad: "Mayor descanso");

  void _changeFrecuencia() {
    setState(() {
      infoSalud.frecuenciaCardiaca += 19;
    });
  }

  void _disminuirFrecuencia() {
    setState(() {
      infoSalud.frecuenciaCardiaca -= 7;
    });
  }

  void _aumentarTemperatura() {
    setState(() {
      infoSalud.temperaturaCorporal += 0.3;
    });
  }

  void _disminuirTemperatura() {
    setState(() {
      infoSalud.temperaturaCorporal -= 0.4;
    });
  }

  void _aumentarCortisol() {
    setState(() {
      infoSalud.nivelCortisol += 2;
    });
  }

  void _disminuirCortisol() {
    setState(() {
      infoSalud.nivelCortisol -= 1;
    });
  }

  void cambiarAnimo() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    DogManager dogManager = DogManager();
    final Dog dog = ModalRoute.of(context)?.settings.arguments as Dog;

    final List<TiempoActividadData> tiempoActividadData = [
      TiempoActividadData('1 pm', infoSalud.tiempoActividad[0]),
      TiempoActividadData('2 pm', infoSalud.tiempoActividad[1]),
      TiempoActividadData('3 pm', infoSalud.tiempoActividad[2]),
      TiempoActividadData('4 pm', infoSalud.tiempoActividad[3]),
      TiempoActividadData('5 pm', infoSalud.tiempoActividad[4]),
      TiempoActividadData('6 pm', infoSalud.tiempoActividad[5]),
      // Agrega más datos según sea necesario
    ];

    List<charts.Series<TiempoActividadData, String>> _createSeriesData() {
      return [
        charts.Series<TiempoActividadData, String>(
          id: 'Tiempo de actividad',
          domainFn: (TiempoActividadData data, _) => data.dia,
          measureFn: (TiempoActividadData data, _) => data.tiempo,
          colorFn: (TiempoActividadData data, _) {
            // Definir condicionales para asignar colores
            if (data.tiempo >= 25) {
              return charts.ColorUtil.fromDartColor(Color(0XFF00496C));
            } else {
              return charts.ColorUtil.fromDartColor(Color(0XFFAA1028));
            }
          },
          data: tiempoActividadData,
        ),
      ];
    }

    List<charts.Series<TiempoActividadData, String>> listaTiempos =
        _createSeriesData();

    String pathConlusionFrecuencia = '';
    String pathConlusionTemperatura = '';
    String pathConlusionCortisol = '';
    String pathConlusionSueno = '';
    String pathEstadoAnimo = '';
    String pathActividad = '';

    //verificacion convenciones frecuencia
    if (infoSalud.frecuenciaCardiaca >= 60 &&
        infoSalud.frecuenciaCardiaca <= 120) {
      infoSalud.conclusionFrecuencia = 'Normal';
      pathConlusionFrecuencia = 'images/collarSeguro.png';
    } else if (infoSalud.frecuenciaCardiaca <= 60) {
      infoSalud.conclusionFrecuencia = 'Reducido';
      pathConlusionFrecuencia = 'images/naranja.png';
    } else if (infoSalud.frecuenciaCardiaca >= 120) {
      infoSalud.conclusionFrecuencia = 'Elevado';
      pathConlusionFrecuencia = 'images/azulAlerta.png';
    }

    //verificar conlsuion temperatura
    if (infoSalud.temperaturaCorporal >= 38.3 &&
        infoSalud.temperaturaCorporal <= 39.2) {
      infoSalud.conclusionTemperatura = 'Normal';
      pathConlusionTemperatura = 'images/collarSeguro.png';
    } else if (infoSalud.temperaturaCorporal <= 38.3) {
      infoSalud.conclusionTemperatura = 'Baja';
      pathConlusionTemperatura = 'images/azulAlerta.png';
    } else if (infoSalud.temperaturaCorporal >= 39.2) {
      infoSalud.conclusionTemperatura = 'Alta';
      pathConlusionTemperatura = 'images/azulAlerta.png';
    }

    //verificar convenciones cortisol

    if (infoSalud.nivelCortisol >= 1 && infoSalud.nivelCortisol <= 2) {
      infoSalud.conclusionCortisol = 'Normal';
      pathConlusionCortisol = 'images/collarSeguro.png';
    } else if (infoSalud.nivelCortisol >= 3 && infoSalud.nivelCortisol <= 7) {
      infoSalud.conclusionCortisol = 'Ligeramente alto';
      pathConlusionCortisol = 'images/naranja.png';
    } else if (infoSalud.nivelCortisol >= 8) {
      infoSalud.conclusionCortisol = 'Alto';
      pathConlusionCortisol = 'images/rojo.png';
    }

    //verificar convenciones del estado de animo

    if (infoSalud.conclusionFrecuencia == "Normal" &&
        infoSalud.conclusionTemperatura == "Normal" &&
        infoSalud.conclusionCortisol == "Normal" &&
        infoSalud.calidadSueno == "Buena") {
      infoSalud.estadoAnimo = "Relajado";
      pathEstadoAnimo = "images/moonC.png";
    } else if ((infoSalud.conclusionFrecuencia == "Normal" ||
            infoSalud.conclusionFrecuencia == "Elevado") &&
        infoSalud.conclusionTemperatura == "Normal" &&
        infoSalud.conclusionCortisol == "Normal" &&
        infoSalud.calidadSueno == "Buena") {
      infoSalud.estadoAnimo = "Feliz";
      pathEstadoAnimo = "images/happyC.png";
    } else if (infoSalud.conclusionFrecuencia == "Elevado" &&
        infoSalud.conclusionTemperatura == "Alta" &&
        infoSalud.conclusionCortisol == "Ligeramente alto" &&
        infoSalud.calidadSueno == "Buena") {
      infoSalud.estadoAnimo = "Emocionado";
      pathEstadoAnimo = "images/excitedC.png";
    } else if (infoSalud.conclusionFrecuencia == "Elevado" &&
        infoSalud.conclusionTemperatura == "Alta" &&
        infoSalud.conclusionCortisol == "Alto" &&
        infoSalud.calidadSueno == "Deficiente") {
      infoSalud.estadoAnimo = "Nervioso";
      pathEstadoAnimo = "images/nervousC.png";
    } else if (infoSalud.conclusionFrecuencia == "Normal" &&
        infoSalud.conclusionCortisol == "Normal" &&
        infoSalud.calidadSueno == "Deficiente") {
      infoSalud.estadoAnimo = "Cansado";
      pathEstadoAnimo = "images/tiredC.png";
    } else if (infoSalud.conclusionFrecuencia == "Reducido" &&
        infoSalud.conclusionTemperatura == "Baja" &&
        infoSalud.conclusionCortisol == "Alto" &&
        infoSalud.calidadSueno == "Deficiente") {
      infoSalud.estadoAnimo = "Enfermo";
      pathEstadoAnimo = "images/sickC.png";
    }

    //verficar imagenes para conclusion de sueño
    if (infoSalud.calidadSueno == 'Excelente') {
      pathConlusionSueno = 'images/collarSeguro.png';
    } else if (infoSalud.calidadSueno == 'Buena') {
      pathConlusionSueno = 'images/collarSeguro.png';
    } else if (infoSalud.calidadSueno == 'Regular') {
      pathConlusionSueno = 'images/amarillo.png';
    } else if (infoSalud.calidadSueno == 'Deficiente') {
      pathConlusionSueno = 'images/naranja.png';
    } else if (infoSalud.calidadSueno == 'Muy deficiente') {
      pathConlusionSueno = 'images/rojo.png';
    }

    //verficar imagenes para conclusion estado de animo
    if (infoSalud.estadoAnimo == 'Relajado') {
      pathEstadoAnimo = 'images/moonC.png';
    } else if (infoSalud.estadoAnimo == 'Feliz') {
      pathEstadoAnimo = 'images/happyC.png';
    } else if (infoSalud.estadoAnimo == 'Emocionado') {
      pathEstadoAnimo = 'images/excitedC.png';
    } else if (infoSalud.estadoAnimo == 'Nervioso') {
      pathEstadoAnimo = 'images/nervousC.png';
    } else if (infoSalud.estadoAnimo == 'Cansado') {
      pathEstadoAnimo = 'images/tiredC.png';
    } else if (infoSalud.estadoAnimo == 'Enfermo') {
      pathEstadoAnimo = 'images/sickC.png';
    }

    int sumaTiempo = infoSalud.tiempoActividad[0] +
        infoSalud.tiempoActividad[1] +
        infoSalud.tiempoActividad[2] +
        infoSalud.tiempoActividad[3] +
        infoSalud.tiempoActividad[4] +
        infoSalud.tiempoActividad[5];

    //verificar actividad fisica
    if (sumaTiempo >= 500) {
      infoSalud.conclusionActividad = "Mayor actividad";
      pathActividad = 'images/thunderB.png';
    } else {
      infoSalud.conclusionActividad = "Menor actividad";
      pathActividad = 'images/sleepR.png';
    }

    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          backgroundColor: Color(0XFFF1F1F1),
          appBar: AppBar(
            shape: ContinuousRectangleBorder(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(
                    10.0), // Ajusta el valor para redondear los bordes deseados
              ),
            ),
            toolbarHeight: 60,
            backgroundColor: Color(0XFFEAEAEA),
            title: Align(
                alignment: Alignment.topCenter,
                child: Row(
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.arrow_back,
                        size: 30,
                      ),
                      color: Color(0XFF00496C),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    SizedBox(
                      width: 45,
                    ),
                    Text(
                      "Monitoreo de Salud",
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ],
                )),
          ),
          body: Padding(
            padding: EdgeInsets.all(30.0),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    width: 330,
                    height: 180,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black
                              .withOpacity(0.25), // Color de la sombra
                          offset: Offset(0,
                              4), // Desplazamiento horizontal y vertical de la sombra
                          blurRadius: 8, // Radio de desenfoque de la sombra
                          spreadRadius: 0, // Propagación de la sombra
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Center(
                        child: Row(
                          children: [
                            SizedBox(
                              width: 20,
                            ),
                            Column(
                              children: [
                                CircleAvatar(
                                    backgroundImage: AssetImage(dog.imagePath),
                                    radius: 50),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  dog.name,
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 16,
                                    color: Colors.black,
                                    //fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 30,
                            ),
                            Column(
                              children: [
                                Text(
                                  "Estado de Ánimo ",
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 16,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  infoSalud.estadoAnimo,
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 18,
                                    color: Colors.black.withOpacity(0.6),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Image(
                                  image: AssetImage(pathEstadoAnimo),
                                  width: 45,
                                  height: 45,
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          _disminuirFrecuencia();
                        },
                        child: Container(
                          width: 10,
                          height: 70,
                          decoration: BoxDecoration(
                            color: Color(0XFFF1F1F1),
                          ),
                        ),
                      ),
                      //frecuencia cardiaca
                      Container(
                        width: 330,
                        height: 115,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black
                                  .withOpacity(0.25), // Color de la sombra
                              offset: Offset(0,
                                  4), // Desplazamiento horizontal y vertical de la sombra
                              blurRadius: 8, // Radio de desenfoque de la sombra
                              spreadRadius: 0, // Propagación de la sombra
                            ),
                          ],
                        ),
                        child: Center(
                          child: Column(
                            children: [
                              SizedBox(
                                height: 15,
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    width: 25,
                                  ),
                                  Image(
                                    image: AssetImage("images/heart.png"),
                                    width: 38,
                                    height: 38,
                                  ),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  Text(
                                    "Frecuencia Cardíaca",
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 17,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    width: 70,
                                  ),
                                  Text(
                                    //aca va el dato de infoSalud.frecuencia
                                    infoSalud.frecuenciaCardiaca.toString(),
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 20,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    " BPM",
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 16,
                                      color: Colors.black.withOpacity(0.6),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 70,
                                  ),
                                  CircleAvatar(
                                    backgroundImage:
                                        AssetImage(pathConlusionFrecuencia),
                                    radius: 14,
                                  ),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  Text(
                                    //aca va el dato de infoSalud.conclusionFrecuencia
                                    infoSalud.conclusionFrecuencia,
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 16,
                                      color: Colors.black,
                                      //fontWeight: FontWeight.bold,
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          // disminuir la frecuencia
                          //Navigator.pushNamed(context, '/info1');
                          _changeFrecuencia();
                        },
                        child: Container(
                          width: 10,
                          height: 70,
                          decoration: BoxDecoration(
                            color: Color(0XFFF1F1F1),
                          ),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(
                    height: 20,
                  ),

                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          // disminuir la temperatura
                          _disminuirTemperatura();
                        },
                        child: Container(
                          width: 10,
                          height: 70,
                          decoration: BoxDecoration(
                            color: Color(0XFFF1F1F1),
                          ),
                        ),
                      ),

                      //temperaturaCorporal
                      Container(
                        width: 330,
                        height: 115,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black
                                  .withOpacity(0.25), // Color de la sombra
                              offset: Offset(0,
                                  4), // Desplazamiento horizontal y vertical de la sombra
                              blurRadius: 8, // Radio de desenfoque de la sombra
                              spreadRadius: 0, // Propagación de la sombra
                            ),
                          ],
                        ),
                        child: Center(
                          child: Column(
                            children: [
                              SizedBox(
                                height: 15,
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    width: 25,
                                  ),
                                  Image(
                                    image: AssetImage("images/temperature.png"),
                                    width: 38,
                                    height: 38,
                                  ),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  Text(
                                    "Temperatura Corporal",
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 17,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    width: 70,
                                  ),
                                  Text(
                                    //aca va el dato de infoSalud.temperatura
                                    infoSalud.temperaturaCorporal
                                        .toStringAsFixed(1),
                                    //medidaT,
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 20,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    " °C",
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 18,
                                      color: Colors.black.withOpacity(0.6),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 65,
                                  ),
                                  CircleAvatar(
                                    backgroundImage:
                                        //hacer el if de la convencion y el numero
                                        AssetImage(pathConlusionTemperatura),
                                    radius: 14,
                                  ),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  Text(
                                    //aca va el dato de infoSalud.conclusionFrecuencia
                                    infoSalud.conclusionTemperatura,
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 16,
                                      color: Colors.black,
                                      //fontWeight: FontWeight.bold,
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),

                      GestureDetector(
                        onTap: () {
                          // aumentar la temperatura
                          _aumentarTemperatura();
                        },
                        child: Container(
                          width: 10,
                          height: 70,
                          decoration: BoxDecoration(
                            color: Color(0XFFF1F1F1),
                          ),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(
                    height: 20,
                  ),

                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          // disminuir cortisol
                          _disminuirCortisol();
                        },
                        child: Container(
                          width: 10,
                          height: 90,
                          decoration: BoxDecoration(
                            color: Color(0XFFF1F1F1),
                          ),
                        ),
                      ),

                      //Nivel de cortisol
                      Container(
                        width: 330,
                        height: 140,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black
                                  .withOpacity(0.25), // Color de la sombra
                              offset: Offset(0,
                                  4), // Desplazamiento horizontal y vertical de la sombra
                              blurRadius: 8, // Radio de desenfoque de la sombra
                              spreadRadius: 0, // Propagación de la sombra
                            ),
                          ],
                        ),
                        child: Center(
                          child: Column(
                            children: [
                              SizedBox(
                                height: 15,
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    width: 25,
                                  ),
                                  Image(
                                    image: AssetImage("images/water.png"),
                                    width: 38,
                                    height: 38,
                                  ),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  Text(
                                    "Nivel de Cortisol",
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 17,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    width: 40,
                                  ),
                                  Text(
                                    //aca va el dato de infoSalud.cortisol
                                    //medidaC,
                                    infoSalud.nivelCortisol.toString(),
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 20,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    " mcg/dL",
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 16,
                                      color: Colors.black.withOpacity(0.6),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 30,
                                  ),
                                  CircleAvatar(
                                    backgroundImage:
                                        //hacer el if de la convencion y el numero
                                        AssetImage(pathConlusionCortisol),
                                    radius: 14,
                                  ),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  Text(
                                    //aca va el dato de infoSalud.conclusionFrecuencia
                                    infoSalud.conclusionCortisol,
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 16,
                                      color: Colors.black,
                                      //fontWeight: FontWeight.bold,
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                "mcg/dL significa micro gramo sobre decilitro",
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 12,
                                  color: Colors.black.withOpacity(0.6),
                                  //fontWeight: FontWeight.bold,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          // aumentar el cortisol

                          _aumentarCortisol();
                        },
                        child: Container(
                          width: 10,
                          height: 90,
                          decoration: BoxDecoration(
                            color: Color(0XFFF1F1F1),
                          ),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          width: 10,
                          height: 70,
                          decoration: BoxDecoration(
                            color: Color(0XFFF1F1F1),
                          ),
                        ),
                      ),
                      //calidad de sueño
                      Container(
                        width: 330,
                        height: 115,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black
                                  .withOpacity(0.25), // Color de la sombra
                              offset: Offset(0,
                                  4), // Desplazamiento horizontal y vertical de la sombra
                              blurRadius: 8, // Radio de desenfoque de la sombra
                              spreadRadius: 0, // Propagación de la sombra
                            ),
                          ],
                        ),
                        child: Center(
                          child: Column(
                            children: [
                              SizedBox(
                                height: 15,
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    width: 25,
                                  ),
                                  Image(
                                    image: AssetImage("images/sleep.png"),
                                    width: 38,
                                    height: 38,
                                  ),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  Text(
                                    "Calidad de Sueño",
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 17,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  SizedBox(width: 105),
                                  CircleAvatar(
                                    backgroundImage:
                                        //hacer el if de la convencion y el numero
                                        AssetImage(pathConlusionSueno),
                                    radius: 14,
                                  ),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  Text(
                                    //aca va el dato de infoSalud.calidadSueño
                                    infoSalud.calidadSueno,
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 16,
                                      color: Colors.black,
                                      //fontWeight: FontWeight.bold,
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 20,
                              ),
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          // disminuir la frecuencia
                          //Navigator.pushNamed(context, '/info1');
                        },
                        child: Container(
                          width: 10,
                          height: 70,
                          decoration: BoxDecoration(
                            color: Color(0XFFF1F1F1),
                          ),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(
                    height: 20,
                  ),

                  //actividad
                  Container(
                    width: 330,
                    height: 125,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                    ),
                    child: Center(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 15,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: 25,
                              ),
                              Image(
                                image: AssetImage("images/activity.png"),
                                width: 38,
                                height: 38,
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              Text(
                                "Tiempo de Actividad Física",
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 17,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: 75,
                              ),
                              Image(
                                image: AssetImage(pathActividad),
                                width: 30,
                                height: 30,
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              Text(
                                //aca va el dato de infoSalud.calidadSueño
                                infoSalud.conclusionActividad,
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 16,
                                  color: Colors.black,
                                  //fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 30,
                          ),
                        ],
                      ),
                    ),
                  ),

                  Container(
                    width: 330,
                    height: 275,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                      ),
                    ),
                    child: BarChartWidget(_createSeriesData(), animate: true),
                  ),

                  //BarChartWidget(_createSeriesData(), animate: true)
                ],
              ),
            ),
          ),
          bottomNavigationBar: Container(
            height: 60, // Establece el tamaño deseado del BottomAppBar
            child: BottomAppBar(
              shape: CircularNotchedRectangle(),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 0,
                  ),
                  IconButton(
                    icon: Image.asset('Icons/homeSinPulsar.png'),
                    iconSize: 39,
                    onPressed: () {
                      // Acción al presionar el ícono de inicio (home)
                      Navigator.pushNamed(context, '/home');
                    },
                  ),
                  IconButton(
                    icon: Image.asset('Icons/locationSinPulsar.png'),
                    iconSize: 39,
                    onPressed: () {
                      // Acción al presionar el ícono de inicio (home)
                      Navigator.pushNamed(context, '/ubicacion');
                    },
                  ),
                  IconButton(
                    icon: Image.asset('Icons/health.png'),
                    iconSize: 39,
                    onPressed: () {
                      // Acción al presionar el ícono de inicio (home)
                      Navigator.pushNamed(context, '/salud1');
                    },
                  ),
                  IconButton(
                    icon: Image.asset('Icons/settingsSinPulsar.png'),
                    iconSize: 39,
                    onPressed: () {
                      // Acción al presionar el ícono de inicio (home)
                      Navigator.pushNamed(context, '/settings');
                    },
                  ),
                  SizedBox(
                    width: 0,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
