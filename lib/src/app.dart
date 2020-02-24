import 'package:flutter/material.dart';

import 'package:practicaflutter/src/pages/alert_page.dart';//aparte de en rutas también lo dejo aquí porque lo uso en el onGenerateRoute
import 'package:practicaflutter/src/routes/routes.dart';

class MyApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // Las rutas sirven para cambiar entre las pantallas de mi aplicación
      // Para manejar varias rutas no se usa home sino routes
      // home: HomePage(),
      initialRoute: '/',
      routes: getApllicationRoutes(),
      // lo que pasa cuando se trata de dirigir a una ruta que no existe
      onGenerateRoute: (settings){
        //settings contiene info de la ruta
        print('Ruta llamada: ${settings.name}');
        return MaterialPageRoute(
          // por ej: que cuando no exista, lo mande a x pagina
          builder: (BuildContext context) => AlertPage()
        );
      },
    );
  }
}