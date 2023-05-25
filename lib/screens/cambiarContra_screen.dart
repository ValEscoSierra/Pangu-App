import 'package:flutter/material.dart';
import 'textoCapturado.dart';

class CambiarContra_screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    bool camposCompletos = false;
    TextEditingController _controllerPassActual = TextEditingController();
    TextEditingController _controllerPassNueva = TextEditingController();
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
                    "Cambiar Contraseña",
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Poppins',
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "!Escribe tu contraseña antigua y la nueva!",
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Poppins',
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(
                    height: 55,
                  ),

                  //campo 1

                  TextField(
                    controller: _controllerPassActual,
                    obscureText: true,
                    decoration: InputDecoration(
                        hintText: "Contraseña Actual",
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

                  //campo 2

                  TextField(
                    controller: _controllerPassNueva,
                    obscureText: true,
                    decoration: InputDecoration(
                        hintText: "Nueva Contraseña",
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

                  //campo 3
                  TextField(
                    controller: _controllerConfrimarPass,
                    obscureText: true,
                    decoration: InputDecoration(
                        hintText: "Confirmar Contraseña",
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
                    height: 5,
                  ),

                  SizedBox(
                    height: 30,
                  ),
                  GestureDetector(
                    onTap: () {
                      //Capturar texto ingrsado por pantalla
                      String passwordActualI = _controllerPassActual.text;
                      String passwordNuevaI = _controllerPassNueva.text;
                      String confirmarPassI = _controllerConfrimarPass.text;

                      //Navigator.pushNamed(context, '/home');

                      if (passwordNuevaI.isNotEmpty &&
                          passwordActualI.isNotEmpty &&
                          confirmarPassI.isNotEmpty) {
                        // Todos los campos están completos

                        if (TextoCapturado.passwordCrear == passwordActualI) {
                          if (passwordNuevaI == confirmarPassI) {
                            Navigator.pushNamed(context, '/profile');
                          } else {
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                title: Text(
                                  'Las contraseñas no coinciden',
                                  style: TextStyle(color: Color(0XFF00496C)),
                                ),
                                content: Text(
                                  'Por favor, reescriba su contraseña',
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
                                          color: Color(0xFF25B8D9),
                                          fontSize: 19),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }
                        } else {
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: Text(
                                'Las contraseñas no coinciden',
                                style: TextStyle(color: Color(0XFF00496C)),
                              ),
                              content: Text(
                                'Por favor, reescriba sus contraseñas',
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
                      } else {
                        // Algunos campos están vacíos, mostrar mensaje de error o realizar alguna acción
                        // por ejemplo, mostrar un Snackbar:
                        /*
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content:
                                Text('Por favor, complete todos los campos'),
                          ),
                        );

                         */
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
                      width: 230,
                      height: 46,
                      decoration: BoxDecoration(
                        color: Color(0XFF00496C),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Center(
                        child: Text(
                          "Cambiar contraseña",
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 18,
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
