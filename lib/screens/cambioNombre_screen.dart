import 'package:flutter/material.dart';
import 'textoCapturado.dart';

class CambioNombre_screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    bool camposCompletos = false;
    TextEditingController _controllerName = TextEditingController();
    TextEditingController _controllerCorreo = TextEditingController();
    TextEditingController _controllerApellido = TextEditingController();
    TextEditingController _controllerPass = TextEditingController();
    TextEditingController _controllerConfrimarPass = TextEditingController();

    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Color(0XFF00496C),
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          body: Padding(
            padding: EdgeInsets.all(30.0),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Modificar Nombre",
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Poppins',
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "!Escribe tus datos!",
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Poppins',
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(
                    height: 35,
                  ),
                  //campo 1
                  TextField(
                    controller: _controllerName,
                    decoration: InputDecoration(
                        hintText: "Nombre ",
                        hintStyle: TextStyle(
                          fontFamily: 'Poppins',
                        )),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 5.0),
                    child: Text(
                      "",
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  //campo1.2
                  SizedBox(
                    height: 5,
                  ),

                  TextField(
                    controller: _controllerApellido,
                    decoration: InputDecoration(
                        hintText: "Apellido ",
                        hintStyle: TextStyle(
                          fontFamily: 'Poppins',
                        )),
                  ),

                  SizedBox(
                    height: 80,
                  ),
                  GestureDetector(
                    onTap: () {
                      //Capturar texto ingrsado por pantalla
                      String nombreI = _controllerName.text;
                      String apellidoI = _controllerApellido.text;

                      //Navigator.pushNamed(context, '/home');

                      if (nombreI.isNotEmpty && apellidoI.isNotEmpty) {
                        // Todos los campos están completos
                        TextoCapturado.nombre = nombreI;
                        TextoCapturado.apellido = apellidoI;
                        Navigator.pushNamed(context, '/home');
                      } else {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: Text(
                              'Error',
                              style: TextStyle(color: Color(0XFF00496C)),
                            ),
                            content: Text(
                              'Por favor, complete todos los campos',
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
                    child: Container(
                      width: 220,
                      height: 46,
                      decoration: BoxDecoration(
                        color: Color(0XFF00496C),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Center(
                        child: Text(
                          "Cambiar Nombre",
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 20,
                              color: Colors.white),
                        ),
                      ),
                    ),
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
