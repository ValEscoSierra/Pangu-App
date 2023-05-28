import 'package:flutter/material.dart';
import 'textoCapturado.dart';
import 'dog.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'infosalud.dart';
//import 'package:camera/camera.dart';
import 'package:image_picker/image_picker.dart';

class AdicionarPerro_screen extends StatefulWidget {
  @override
  _AdicionarPerroScreenState createState() => _AdicionarPerroScreenState();
}

class _AdicionarPerroScreenState extends State<AdicionarPerro_screen> {
  String photo = 'images/labrador.jpg';

  void _changePhoto(String newPhoto) {
    setState(() {
      photo = newPhoto;
    });
  }

  void _showImagePicker() async {
    final result = await showDialog<String>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Elige la foto de tu perro',
            textAlign: TextAlign.center,
            style: TextStyle(color: Color(0XFF00496C)),
          ),
          content: Container(
              alignment: Alignment.center,
              height: 600,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          _changePhoto('images/zenu.jpg');
                          Navigator.pop(context);
                        },
                        child: CircleAvatar(
                          backgroundImage: AssetImage('images/zenu.jpg'),
                          radius: 50,
                        ),
                      ),
                      SizedBox(
                        width: 35,
                      ),
                      GestureDetector(
                        onTap: () {
                          _changePhoto('images/channel.jpg');
                          Navigator.pop(context);
                        },
                        child: CircleAvatar(
                          backgroundImage: AssetImage('images/channel.jpg'),
                          radius: 50,
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
                          _changePhoto('images/golden.jpg');
                          Navigator.pop(context);
                        },
                        child: CircleAvatar(
                          backgroundImage: AssetImage('images/golden.jpg'),
                          radius: 50,
                        ),
                      ),
                      SizedBox(
                        width: 35,
                      ),
                      GestureDetector(
                        onTap: () {
                          _changePhoto('images/Nylla.jpeg');
                          Navigator.pop(context);
                        },
                        child: CircleAvatar(
                          backgroundImage: AssetImage('images/Nylla.jpeg'),
                          radius: 50,
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
                          _changePhoto('images/beagle.jpg');
                          Navigator.pop(context);
                        },
                        child: CircleAvatar(
                          backgroundImage: AssetImage('images/beagle.jpg'),
                          radius: 50,
                        ),
                      ),
                      SizedBox(
                        width: 35,
                      ),
                      GestureDetector(
                        onTap: () {
                          _changePhoto('images/labrador.jpg');
                          Navigator.pop(context);
                        },
                        child: CircleAvatar(
                          backgroundImage: AssetImage('images/labrador.jpg'),
                          radius: 50,
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
                          _changePhoto('images/huskey.jpg');
                          Navigator.pop(context);
                        },
                        child: CircleAvatar(
                          backgroundImage: AssetImage('images/huskey.jpg'),
                          radius: 50,
                        ),
                      ),
                      SizedBox(
                        width: 35,
                      ),
                      GestureDetector(
                        onTap: () {
                          _changePhoto('images/shitzu.jpg');
                          Navigator.pop(context);
                        },
                        child: CircleAvatar(
                          backgroundImage: AssetImage('images/shitzu.jpg'),
                          radius: 50,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 23),
                  GestureDetector(
                    onTap: () async {
                      final image = await ImagePicker()
                          .getImage(source: ImageSource.camera);
                      if (image != null) {
                        Navigator.pop(context, image.path);
                      }
                    },
                    child: Container(
                      width: 220,
                      height: 46,
                      decoration: BoxDecoration(
                        color: Color(0XFF25B8D9),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Center(
                        child: Text(
                          'Tomar foto desde tu camara',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 12,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              )),
        );
      },
    );
    if (result != null) {
      setState(() {
        photo = result;
      });
    }
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
            title: Row(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, '/ubicacion');
                  },
                  child: Text(
                    "Cancelar",
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Poppins',
                        fontSize: 16),
                  ),
                ),
                SizedBox(
                  width: 63,
                ),
                Align(
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
                SizedBox(
                  width: 60,
                ),
                InkWell(
                  onTap: () {
                    //Navigator.pushNamed(context, '/ubicacion');
                    String nombreIngresado = _controllerNombre.text;
                    if (nombreIngresado.isNotEmpty) {
                      DogManager().addDog(nombreIngresado, photo);
                      Navigator.pushNamed(context, '/ubicacion');
                    } else {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: Text(
                            'Necesita llenar el nombre de su perro',
                            style: TextStyle(color: Color(0XFF00496C)),
                          ),
                          content: Text(
                            'Por favor, reescriba sus datos',
                            style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 18,
                                color: Colors.black),
                          ),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: Text(
                                'Aceptar',
                                style: TextStyle(
                                    color: Color(0xFF25B8D9), fontSize: 19),
                              ),
                            ),
                          ],
                        ),
                      );
                    }
                  },
                  child: Text(
                    "Siguiente",
                    style: TextStyle(
                        color: Color(0xFF25B8D9),
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Poppins',
                        fontSize: 16),
                  ),
                ),
              ],
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
                    onTap: _showImagePicker,
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
                      onTap: _showImagePicker,
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
                ],
              ),
              //nombre del perro
              Padding(
                  padding: EdgeInsets.all(30.0),
                  child: Center(
                    child: Column(
                      children: [
                        TextField(
                          controller: _controllerNombre,
                          decoration: InputDecoration(
                              hintText: "Nombre",
                              hintStyle: TextStyle(
                                fontFamily: 'Poppins',
                              )),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 10.0),
                          child: Text(
                            "",
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  )),
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
