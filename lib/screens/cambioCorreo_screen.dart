import 'package:flutter/material.dart';
import 'textoCapturado.dart';

class CambioCorreo_screen extends StatelessWidget {
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
                    "Modificar Correo Electrónico",
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Poppins',
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "!Escribe tu nuevo correo!",
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
                    controller: _controllerCorreo,
                    decoration: InputDecoration(
                        hintText: "Correo ",
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
                  SizedBox(
                    height: 80,
                  ),
                  GestureDetector(
                    onTap: () {
                      //Capturar texto ingrsado por pantalla
                      String correoI = _controllerCorreo.text;

                      //Navigator.pushNamed(context, '/home');

                      if (correoI.isNotEmpty) {
                        // Todos los campos están completos
                        TextoCapturado.correoElectronicoLogin = correoI;
                        TextoCapturado.correoElectronicoCrear = correoI;
                        Navigator.pushNamed(context, '/profile');
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
                          "Cambiar Correo",
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
