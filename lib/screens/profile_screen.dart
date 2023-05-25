import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:i_am_rich/screens/avatar.dart';
import 'textoCapturado.dart';

Avatar _avatar = Avatar(photo: 'images/collarAvatar.jpg');
String avatarJson = jsonEncode(_avatar);

class Profile_screen extends StatefulWidget {
  @override
  _Profile_screenState createState() => _Profile_screenState();
}

class _Profile_screenState extends State<Profile_screen> {
  String photo = 'images/collarAvatar.jpg';

  void _changePhoto(String newPhoto) {
    setState(() {
      photo = newPhoto;
    });
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController _controllerNombre = TextEditingController();
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
                "Perfil",
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
              SizedBox(
                height: 50,
              ),

              //imagen del perro
              Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text(
                                'Elige tu avatar',
                                textAlign: TextAlign.center,
                                style: TextStyle(color: Color(0XFF00496C)),
                              ),
                              content: Container(
                                  alignment: Alignment.center,
                                  height: 300,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        height: 15,
                                      ),
                                      Row(
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              _changePhoto(
                                                  'images/collarAvatar.jpg');
                                              TextoCapturado.rutaAvatar =
                                                  'images/collarAvatar.jpg';
                                              Navigator.pop(context);
                                            },
                                            child: CircleAvatar(
                                              backgroundImage: AssetImage(
                                                  'images/collarAvatar.jpg'),
                                              radius: 58,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 35,
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              _changePhoto(
                                                  'images/comidaAvatar.png');
                                              TextoCapturado.rutaAvatar =
                                                  'images/comidaAvatar.png';
                                              Navigator.pop(context);
                                            },
                                            child: CircleAvatar(
                                              backgroundImage: AssetImage(
                                                  'images/comidaAvatar.png'),
                                              radius: 58,
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 25,
                                      ),
                                      Row(
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              _changePhoto(
                                                  'images/paseoAvatar.png');
                                              TextoCapturado.rutaAvatar =
                                                  'images/paseoAvatar.png';
                                              Navigator.pop(context);
                                            },
                                            child: CircleAvatar(
                                              backgroundImage: AssetImage(
                                                  'images/paseoAvatar.png'),
                                              radius: 58,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 35,
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              _changePhoto(
                                                  'images/casaAvatar.png');
                                              TextoCapturado.rutaAvatar =
                                                  'images/casaAvatar.png';
                                              Navigator.pop(context);
                                            },
                                            child: CircleAvatar(
                                              backgroundImage: AssetImage(
                                                  'images/casaAvatar.png'),
                                              radius: 58,
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 25,
                                      ),
                                    ],
                                  )),
                            );
                          });
                    },
                    child: CircleAvatar(
                      backgroundImage: AssetImage(photo),
                      radius:
                          70, // Ajusta el tamaño del círculo según tus necesidades
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  InkWell(
                      onTap: () {},
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          "Cambiar Foto",
                          style: TextStyle(
                              color: Colors.black.withOpacity(0.6),
                              fontFamily: 'Poppins',
                              fontSize: 13),
                        ),
                      )),

                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: 40.0), // Ajusta el valor según tus necesidades
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Nombre",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Poppins',
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: 40.0), // Ajusta el valor según tus necesidades
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/cambioNombre');
                        },
                        child: Container(
                          width: 330,
                          height: 50,
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
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 25,
                                ),
                                Image(
                                  image: AssetImage("images/edit.png"),
                                  width: 22,
                                  height: 22,
                                ),
                                SizedBox(
                                  width: 15,
                                ),
                                Text(
                                  TextoCapturado.nombre +
                                      " " +
                                      TextoCapturado.apellido,
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 15,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: 40.0), // Ajusta el valor según tus necesidades
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Correo",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Poppins',
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  //cambiar correo
                  Padding(
                    padding: EdgeInsets.only(
                        left: 40.0), // Ajusta el valor según tus necesidades
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/cambioCorreo');
                        },
                        child: Container(
                          width: 330,
                          height: 50,
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
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 25,
                                ),
                                Image(
                                  image: AssetImage("images/edit.png"),
                                  width: 22,
                                  height: 22,
                                ),
                                SizedBox(
                                  width: 15,
                                ),
                                Text(
                                  TextoCapturado.correoElectronicoCrear,
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 15,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: 40.0), // Ajusta el valor según tus necesidades
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Contraseña",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Poppins',
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  //cambiar correo
                  Padding(
                    padding: EdgeInsets.only(
                        left: 40.0), // Ajusta el valor según tus necesidades
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/cambiarContra');
                        },
                        child: Container(
                          width: 330,
                          height: 50,
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
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 25,
                                ),
                                Image(
                                  image: AssetImage("images/edit.png"),
                                  width: 22,
                                  height: 22,
                                ),
                                SizedBox(
                                  width: 15,
                                ),
                                Text(
                                  "Cambiar Contraseña",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Poppins',
                                    fontSize: 15,
                                    color: Colors.black.withOpacity(0.6),
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
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
