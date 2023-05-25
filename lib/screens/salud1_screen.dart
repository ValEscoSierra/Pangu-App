import 'package:flutter/material.dart';
import 'dog.dart';

class Salud1_screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Dog> dogs = DogManager().getDogs();
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
              child: Text(
                "Monitoreo de Salud",
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
          ),
          body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                ...dogs.map((dog) {
                  return Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal:
                            30), // Espacio horizontal alrededor de cada columna
                    child: Column(
                      children: [
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                          child: Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.pushNamed(
                                    context,
                                    '/detalleMonitoreo',
                                    arguments:
                                        dog, // Pasar el objeto Dog como argumento
                                  );
                                },
                                child: Container(
                                  width: 350,
                                  height: 90,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(15),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(
                                            0.25), // Color de la sombra
                                        offset: Offset(0,
                                            4), // Desplazamiento horizontal y vertical de la sombra
                                        blurRadius:
                                            8, // Radio de desenfoque de la sombra
                                        spreadRadius:
                                            0, // Propagación de la sombra
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
                                            CircleAvatar(
                                              backgroundImage:
                                                  AssetImage(dog.imagePath),
                                              radius: 30,
                                            ),
                                            SizedBox(
                                              width: 20,
                                            ),
                                            Text(
                                              dog.name,
                                              style: TextStyle(
                                                fontFamily: 'Poppins',
                                                fontSize: 16,
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                }).toList(),
                SizedBox(
                  width: 10,
                ),
                // Imagen de "Añadir perro" siempre presente
              ],
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
