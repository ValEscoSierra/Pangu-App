import 'package:flutter/material.dart';
import 'textoCapturado.dart';
import 'dog.dart';

class Home_screen extends StatefulWidget {
  @override
  _Home_screenState createState() => _Home_screenState();
}

class _Home_screenState extends State<Home_screen> {
  String photo = 'images/collarAvatar.jpg';
  void _changePhoto(String newPhoto) {
    setState(() {
      photo = TextoCapturado.rutaAvatar;
    });
  }

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
            toolbarHeight: 72,
            backgroundColor: Color(0XFFEAEAEA),
            title: Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 24.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "P",
                      style: TextStyle(
                        color: Color(0xFF00496C),
                        fontFamily: 'Pangu',
                        fontSize: 57,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 70,
                ),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Bogotá ,",
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Colombia",
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Poppins',
                      fontSize: 16,
                    ),
                  ),
                ),
                SizedBox(
                  width: 64,
                ),
                GestureDetector(
                  onTap: () {
                    // Acción a realizar cuando se presione la foto
                    Navigator.pushNamed(context, '/settings');
                  },
                  child: Container(
                    width: 50,
                    height: 50,
                    child: CircleAvatar(
                      backgroundImage: AssetImage('images/collarAvatar.jpg'),
                      radius: 50,
                    ),
                  ),
                ),
              ],
            ),
          ),
          body: Padding(
            padding: EdgeInsets.all(30.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "!Hola " + TextoCapturado.nombre + "!",
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Poppins',
                      fontSize: 20,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "¿Dónde está tu perro?",
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Vamos a ver donde está tu perro, es mejor verificar si está seguro",
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Poppins',
                      fontSize: 16,
                    ),
                  ),
                ),
                SizedBox(
                  height: 18,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/ubicacion');
                  },
                  child: Container(
                    width: 337,
                    height: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        image: AssetImage('images/mapa.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Stack(
                      children: [
                        Positioned.fill(
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.black.withOpacity(0.4),
                            ),
                          ),
                        ),
                        Positioned.fill(
                          child: Center(
                            child: Column(
                              children: [
                                //icono ubu
                                SizedBox(
                                  height: 25,
                                ),
                                Container(
                                  width: 50, // Ancho deseado de la imagen
                                  height: 50, // Alto deseado de la imagen
                                  child: Image.asset(
                                    'images/locationA.png', // Ruta de la imagen en tus assets
                                    fit: BoxFit
                                        .cover, // Ajuste de la imagen dentro del contenedor
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "¿Monitoreo de Salud?",
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Monitorea métricas de salud como: rítmo cardíaco, tasa de resposo y mucho más",
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Poppins',
                      fontSize: 16,
                    ),
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      if (dogs
                          .isEmpty) // Verifica si la lista de perros está vacía
                        Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(context, '/ubicacion');
                              },
                              child: Container(
                                width: 337,
                                height: 100,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  image: DecorationImage(
                                    image: AssetImage('images/summer.jpg'),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                child: Stack(
                                  children: [
                                    Positioned.fill(
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: Colors.black.withOpacity(0.4),
                                        ),
                                      ),
                                    ),
                                    Positioned.fill(
                                      child: Center(
                                        child: Column(
                                          children: [
                                            SizedBox(
                                              height: 30,
                                            ),
                                            Text(
                                              '¡Todavia no tienes perros !',
                                              style: TextStyle(
                                                fontFamily: 'Pangu',
                                                color: Colors.white,
                                                fontSize: 30,
                                              ),
                                            ),
                                            Text(
                                              '¿Qué esperas para añadir uno?',
                                              style: TextStyle(
                                                fontFamily: 'Poppins',
                                                color: Colors.white,
                                                fontSize: 14,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )),
                      ...dogs.map((dog) {
                        return Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Column(
                            children: [
                              SizedBox(
                                height: 10,
                              ),
                              GestureDetector(
                                onTap: () {
                                  // Acción a realizar cuando se presione la foto del perro
                                },
                                child: CircleAvatar(
                                  backgroundImage: AssetImage(dog.imagePath),
                                  radius: 46,
                                ),
                              ),
                              Align(
                                alignment: Alignment.center,
                                child: Text(
                                  dog.name,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: 'Poppins',
                                    fontSize: 18,
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
                    ],
                  ),
                ),
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
                    icon: Image.asset('Icons/home.png'),
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
