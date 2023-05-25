import 'package:flutter/material.dart';

class Info1_screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFF00496C),
        body: Padding(
          padding: EdgeInsets.all(30.0), // establecer los margenes deseados
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  alignment: Alignment.topRight,
                  child: InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, '/createAc');
                    },
                    child: Text(
                      "Saltar",
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Poppins',
                          fontSize: 16),
                    ),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  "Pangu",
                  style: TextStyle(
                      color: Colors.white, fontFamily: 'Pangu', fontSize: 96),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Sientete seguro en donde sea que se encuentre tu perro, no más preocupaciones o arrepentimientos",
                  style: TextStyle(
                      fontFamily: 'Poppins', color: Colors.white, fontSize: 16),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 15,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(37),
                  child: Image(
                    image: AssetImage('images/fantasma.jpg'),
                    width: 276,
                    height: 222,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                //aqui va un row con los 3 botones circulares
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    //boton 1 circular
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        width: 17,
                        height: 17,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    //Boton 2 circular
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/info2');
                      },
                      child: Container(
                        width: 10,
                        height: 10,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    //Boton 3 circular
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/info3');
                      },
                      child: Container(
                        width: 10,
                        height: 10,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
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
                    Navigator.pushNamed(context, '/login');
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
                        "Iniciar Sesión",
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 16,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/createAc');
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
                        "Crear Cuenta",
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 16,
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
    ));
  }
}
