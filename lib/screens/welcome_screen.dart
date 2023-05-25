import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFF00496C),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 1,
              ),
              Image(
                image: AssetImage("images/newIcon.png"),
                width: 480,
                height: 300,
              ),
              Text("Pangu",
                  style: TextStyle(
                    fontSize: 96,
                    fontFamily: 'Pangu',
                    color: Colors.white,
                  )),
              SizedBox(
                height: 80,
              ),
              GestureDetector(
                //este widget va ddentro de los hijos de la columna que van centrados en el cuerpo
                onTap: () {
                  // Acción a realizar cuando se presione el botón
                  Navigator.pushNamed(context, '/info1');
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
                      'Comenzar',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    ));
  }
}
