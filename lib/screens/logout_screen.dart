import 'package:flutter/material.dart';
import 'textoCapturado.dart';

class Logout_screen extends StatelessWidget {
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
                    Navigator.pushNamed(context, '/ubicacion');
                    String nombreIngresado = _controllerNombre.text;
                    TextoCapturado.nombrePerritos.add(nombreIngresado);
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
                    onTap: () {
                      // Acción a realizar cuando se presione la foto
                    },
                    child: CircleAvatar(
                      backgroundImage: AssetImage('images/zenu.jpg'),
                      radius:
                          70, // Ajusta el tamaño del círculo según tus necesidades
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, '/createAc');
                      },
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
