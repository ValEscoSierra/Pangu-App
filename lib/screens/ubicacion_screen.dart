import 'dart:async';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:i_am_rich/screens/detallePerro_screen.dart';
import 'package:i_am_rich/screens/home_screen.dart';
import 'dog.dart';
import 'package:provider/provider.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Ubicacion_screen extends StatefulWidget {
  @override
  State<Ubicacion_screen> createState() => _Ubicacion_screen();
}

class _Ubicacion_screen extends State<Ubicacion_screen> {
  double Lat = 4.7006648;
  double Long = -74.0344053;

  @override
  Widget build(BuildContext context) {
    List<Dog> dogs = DogManager().getDogs();
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          backgroundColor: Color(0XFF00496C),
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
                "Ubicación",
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
          ),
          body: Column(
            children: [
              //API DE GOOGLE MAPS
              Container(
                width: 700,
                height: 370,
                child: Lat == null
                    ? const Center(child: Text("Loading"))
                    : GoogleMap(
                        initialCameraPosition: CameraPosition(
                          target: LatLng(Lat, Long),
                          zoom: 10,
                        ),
                        markers: {
                          Marker(
                              markerId: const MarkerId("Ubicacion"),
                              position: LatLng(Lat, Long))
                        },
                      ),
              ),

              //PERROS Y SUS ESTADOS
              Container(
                width: 700,
                height: 193.3,
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal:
                          20), // Agrega los márgenes izquierdo y derecho deseados
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Divider(
                        color: Color(0xFFEAEAEA),
                        height: 20,
                        thickness: 3,
                        indent: 160,
                        endIndent: 160,
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Encuentra y mira el estado de tu perro",
                          style: TextStyle(
                            color: Colors.black.withOpacity(0.6),
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                      ),
                      Divider(
                        color: Color(0xFFEAEAEA),
                        height: 20,
                        thickness: 2,
                        indent: 0,
                        endIndent: 0,
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            ...dogs.map((dog) {
                              return Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal:
                                        10), // Espacio horizontal alrededor de cada columna
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: 10,
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        // Acción a realizar cuando se presione la foto del perro
                                        Navigator.pushNamed(
                                          context,
                                          '/detallePerro',
                                          arguments:
                                              dog, // Pasar el objeto Dog como argumento
                                        );
                                      },
                                      child: CircleAvatar(
                                        backgroundImage:
                                            AssetImage(dog.imagePath),
                                        radius: 40,
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.center,
                                      child: Text(
                                        dog.name,
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontFamily: 'Poppins',
                                          fontSize: 12,
                                        ),
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

                            Column(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    // Acción a realizar cuando se presione la foto
                                    Navigator.pushNamed(
                                        context, '/adicionarPerro');
                                  },
                                  child: CircleAvatar(
                                    backgroundImage: AssetImage(
                                        'images/adicionarMascota.png'),
                                    radius: 40,
                                  ),
                                ),
                                Text(
                                  "Añadir Perro",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: 'Poppins',
                                    fontSize: 12,
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
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
                    icon: Image.asset('Icons/locationOn.png'),
                    iconSize: 39,
                    onPressed: () {
                      // Acción al presionar el ícono de inicio (home)
                      Navigator.pushNamed(context, '/ubicacion');
                    },
                  ),
                  IconButton(
                    icon: Image.asset('Icons/healthSinPulsar.png'),
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
