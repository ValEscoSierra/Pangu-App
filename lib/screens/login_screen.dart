import 'package:flutter/material.dart';
import 'package:i_am_rich/screens/home_screen.dart';
import 'package:i_am_rich/screens/ubicacion_screen.dart';
import 'textoCapturado.dart';

class Login_screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextEditingController _controllerCorreo = TextEditingController();
    TextEditingController _controllerContra = TextEditingController();
    bool continuar = false;
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          backgroundColor: Color(0XFFF1F1F1),
          appBar: AppBar(
            backgroundColor: Color(0XFF00496C),
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            title: Text(
              "Iniciar Sesión",
              style: TextStyle(
                color: Color(0XFFF1F1F1),
                fontFamily: 'Poppins',
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            centerTitle: true,
          ),
          body: Padding(
            padding: EdgeInsets.all(30.0),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image(
                    image: AssetImage("images/newIcon.png"),
                    width: 300,
                    height: 150,
                  ),
                  Text("Pangu",
                      style: TextStyle(
                        fontSize: 76,
                        fontFamily: 'Pangu',
                        color: Color(0XFF00496C),
                      )),
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
                  TextField(
                    controller: _controllerCorreo,
                    decoration: InputDecoration(
                        hintText: "Correo electrónico",
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
                  TextField(
                    obscureText: true,
                    controller: _controllerContra,
                    decoration: InputDecoration(
                        hintText: "Contraseña",
                        hintStyle: TextStyle(
                          fontFamily: 'Poppins',
                        )),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "¿Eres nuevo por aquí?",
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
                            Navigator.pushNamed(context, '/createAc');
                          },
                          child: Text(
                            "  Crea Cuenta",
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
                    height: 50,
                  ),
                  GestureDetector(
                    onTap: () {
                      String correoIngresado = _controllerCorreo.text;
                      String passwordIngresada = _controllerContra.text;
                      TextoCapturado.correoElectronicoLogin = correoIngresado;
                      TextoCapturado.passwordIniciar = passwordIngresada;
                      if (correoIngresado.isNotEmpty &&
                          passwordIngresada.isNotEmpty) {
                        TextoCapturado.correoElectronicoLogin = correoIngresado;
                        TextoCapturado.passwordIniciar = passwordIngresada;

                        if (TextoCapturado.passwordCrear == passwordIngresada &&
                            TextoCapturado.correoElectronicoCrear ==
                                correoIngresado) {
                          Navigator.pushNamed(context, '/home');
                          continuar = true;
                        } else {
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: Text(
                                'Sus datos no coinciden',
                                style: TextStyle(color: Color(0XFF00496C)),
                              ),
                              content: Text(
                                'Por favor, reescriba su datos',
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
                          continuar = false;
                        }
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
                          "Iniciar Sesión",
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
