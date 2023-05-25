import 'package:flutter/material.dart';

class Settings_screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
            toolbarHeight: 72,
            backgroundColor: Color(0XFFEAEAEA),
            title: Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 24.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "P",
                      style: TextStyle(
                        color: Color(0xFF00496C),
                        fontFamily: 'Pangu',
                        fontSize: 57,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 70,
                ),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Bogotá ,",
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Colombia",
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Poppins',
                      fontSize: 16,
                    ),
                  ),
                ),
                SizedBox(
                  width: 64,
                ),
                GestureDetector(
                  onTap: () {
                    // Acción a realizar cuando se presione la foto
                  },
                  child: Container(
                    width: 50,
                    height: 50,
                    child: CircleAvatar(
                      backgroundImage: AssetImage('images/collarAvatar.jpg'),
                      radius: 50,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
