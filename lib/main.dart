import 'package:flutter/material.dart';
import 'package:i_am_rich/screens/detalleMonitoreo_screen.dart';
import 'package:i_am_rich/screens/detallePerro_screen.dart';
import 'package:i_am_rich/screens/settings.dart';
import 'screens/welcome_screen.dart';
import 'screens/info1_screen.dart';
import 'screens/info2_screen.dart';
import 'screens/info3_screen.dart';
import 'screens/login_screen.dart';
import 'screens/createAc_screen.dart';
import 'screens/home_screen.dart';
import 'screens/ubicacion_screen.dart';
import 'screens/salud1_screen.dart';
import 'screens/adicionarPerro_screen.dart';
import 'screens/profile_screen.dart';
import 'screens/logout_screen.dart';
import 'screens/cambioNombre_screen.dart';
import 'screens/cambioCorreo_screen.dart';
import 'screens/cambiarContra_screen.dart';
import 'screens/pruebaMapa_screen.dart';
import 'screens/dog.dart';
import 'screens/detalleMonitoreo_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      initialRoute: '/',
      routes: {
        '/': (context) => WelcomeScreen(),
        '/info1': (context) => Info1_screen(),
        '/info2': (context) => Info2_screen(),
        '/info3': (context) => Info3_screen(),
        '/login': (context) => Login_screen(),
        '/createAc': (context) => CreateAc_screen(),
        '/home': (context) => Home_screen(),
        '/ubicacion': (context) => Ubicacion_screen(),
        '/salud1': (context) => Salud1_screen(),
        '/settings': (context) => Settings_screen(),
        '/adicionarPerro': (context) => AdicionarPerro_screen(),
        '/profile': (context) => Profile_screen(),
        '/logout': (context) => Logout_screen(),
        '/cambioNombre': (context) => CambioNombre_screen(),
        '/cambioCorreo': (context) => CambioCorreo_screen(),
        '/cambiarContra': (context) => CambiarContra_screen(),
        '/detallePerro': (context) => DetallePerro_screen(),
        '/detalleMonitoreo': (context) => DetalleMonitoreo_screen(),
      },
    );
  }
}
