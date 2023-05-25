import 'package:flutter/material.dart';
import 'dog.dart';

class DetallePerro_screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    DogManager dogManager = DogManager();
    final Dog dog = ModalRoute.of(context)?.settings.arguments as Dog;

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
                height: 340,
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
              ),

              //PERROS Y SUS ESTADOS
              Container(
                width: 700,
                height: 223,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                  color: Colors.white,
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal:
                          20), // Agrega los márgenes izquierdo y derecho deseados
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 1,
                      ),
                      Row(
                        children: [
                          IconButton(
                            icon: Icon(Icons.keyboard_arrow_down),
                            color: Color(0xFFCCCCCC),
                            iconSize: 39,
                            onPressed: () {
                              // Acción al presionar el ícono de inicio (home)
                              Navigator.pushNamed(context, '/ubicacion');
                            },
                          ),
                          SizedBox(
                            width: 90,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment
                                .center, // Alineación vertical al centro
                            children: [
                              CircleAvatar(
                                backgroundImage: AssetImage(dog.imagePath),
                                radius: 35,
                              ),
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
                              )
                            ],
                          ),
                          SizedBox(
                            width: 50,
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.pushNamed(context, '/ubicacion');
                              DogManager().removeDog(dog.name);
                            },
                            child: Text(
                              "Eliminar perro",
                              style: TextStyle(
                                  color: Colors.black.withOpacity(0.6),
                                  fontFamily: 'Poppins',
                                  fontSize: 14),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      GestureDetector(
                        onTap: () {
                          //  Navigator.pushNamed(context, '/profile');
                        },
                        child: Container(
                          width: 350,
                          height: 90,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black
                                    .withOpacity(0.25), // Color de la sombra
                                offset: Offset(0,
                                    4), // Desplazamiento horizontal y vertical de la sombra
                                blurRadius:
                                    8, // Radio de desenfoque de la sombra
                                spreadRadius: 0, // Propagación de la sombra
                              ),
                            ],
                          ),
                          child: Center(
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 8,
                                ),
                                Row(
                                  children: [
                                    SizedBox(
                                      width: 25,
                                    ),
                                    /*
                                    Image(
                                      image: AssetImage("images/profile.png"),
                                      width: 28,
                                      height: 28,
                                    ),

                                     */

                                    Text(
                                      "Estado del Collar",
                                      style: TextStyle(
                                        fontFamily: 'Poppins',
                                        fontSize: 16,
                                        color: Colors.black.withOpacity(0.7),
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    SizedBox(
                                      width: 25,
                                    ),
                                    CircleAvatar(
                                      backgroundImage:
                                          AssetImage('images/collarSeguro.png'),
                                      radius: 15,
                                    ),
                                    SizedBox(
                                      width: 8,
                                    ),
                                    Text(
                                      "Conectado",
                                      style: TextStyle(
                                        fontFamily: 'Poppins',
                                        fontSize: 13,
                                        color: Colors.black,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 120,
                                    ),
                                    Container(
                                      child: Column(
                                        children: [
                                          //row
                                          Row(
                                            children: [
                                              ClipRRect(
                                                borderRadius: BorderRadius.circular(
                                                    10), // Ajusta el radio de acuerdo a tus necesidades
                                                child: Image.asset(
                                                  'images/wifi.png',
                                                  width:
                                                      30, // Establece el ancho deseado de la imagen
                                                  height:
                                                      30, // Establece la altura deseada de la imagen
                                                  fit: BoxFit
                                                      .cover, // Ajusta la forma en que la imagen se ajusta al tamaño
                                                ),
                                              ),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              ClipRRect(
                                                borderRadius: BorderRadius.circular(
                                                    10), // Ajusta el radio de acuerdo a tus necesidades
                                                child: Image.asset(
                                                  'images/gps.png',
                                                  width:
                                                      30, // Establece el ancho deseado de la imagen
                                                  height:
                                                      30, // Establece la altura deseada de la imagen
                                                  fit: BoxFit
                                                      .cover, // Ajusta la forma en que la imagen se ajusta al tamaño
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                            "GPS satelital",
                                            style: TextStyle(
                                              fontFamily: 'Poppins',
                                              fontSize: 12,
                                              color:
                                                  Colors.black.withOpacity(0.7),
                                            ),
                                          )
                                          //icono gps o wifi

                                          //el texto de outdoors gps
                                        ],
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
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
