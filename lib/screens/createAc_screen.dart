import 'package:flutter/material.dart';
import 'textoCapturado.dart';

class CreateAc_screen extends StatelessWidget {
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
                    "Crear cuenta",
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Poppins',
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "!Vamos a empezar!",
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Poppins',
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(
                    height: 5,
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
                    controller: _controllerCorreo,
                    decoration: InputDecoration(
                        hintText: "Correo electrónico",
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
                    controller: _controllerPass,
                    obscureText: true,
                    decoration: InputDecoration(
                        hintText: "Contraseña",
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

                  //campo 5
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

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "¿Ya tienes una cuenta?",
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Poppins',
                          fontSize: 16,
                        ),
                      ),
                      Container(
                        alignment: Alignment.topRight,
                        child: InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, '/login');
                          },
                          child: Text(
                            "  Inicia Sesión",
                            style: TextStyle(
                              color: Color(0xFF25B8D9),
                              fontFamily: 'Poppins',
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(
                    height: 30,
                  ),
                  GestureDetector(
                    onTap: () {
                      //Capturar texto ingrsado por pantalla
                      String nombreI = _controllerName.text;
                      String apellidoI = _controllerApellido.text;
                      String correoI = _controllerCorreo.text;
                      String passwordI = _controllerPass.text;
                      String confirmarPassI = _controllerConfrimarPass.text;

                      //Navigator.pushNamed(context, '/home');

                      if (nombreI.isNotEmpty &&
                          apellidoI.isNotEmpty &&
                          correoI.isNotEmpty &&
                          passwordI.isNotEmpty &&
                          confirmarPassI.isNotEmpty) {
                        // Todos los campos están completos
                        TextoCapturado.nombre = nombreI;
                        TextoCapturado.apellido = apellidoI;
                        TextoCapturado.correoElectronicoCrear = correoI;
                        TextoCapturado.passwordCrear = passwordI;
                        TextoCapturado.passwordConfirm = confirmarPassI;

                        if (passwordI == confirmarPassI) {
                          Navigator.pushNamed(context, '/home');
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
                      width: 220,
                      height: 46,
                      decoration: BoxDecoration(
                        color: Color(0XFF00496C),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Center(
                        child: Text(
                          "Crear Cuenta",
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
