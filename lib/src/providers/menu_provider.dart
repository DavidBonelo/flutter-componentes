// nota dedspues haber hecho toda esta wea, entender la creacion de un ListView a partir de un json esta cabron
// porque toca hacer que la ListView se cree despues de que se lea el json y se guarde el dato

// en resumen, este menu_provider tiene una clase que es privada y tiene la propiedad opciones,
// este menu_provider tambien tiene un metodo que retorna un future con el la info de la propiedad opciones
// este menu_provider tambiencrea una instancia de esa clase

import 'package:flutter/services.dart' show rootBundle; //para leer json
import 'dart:convert';//para pasar json a Map

class _MenuProvider {
  List<dynamic> opciones = [];

  _MenuProvider() {
  // cuendo imprimo la propiedad opciones apenas arranca la app, la imprime vacía, porque
  // el metodo para leer el json se ejecuta en un hilo independiente (el metodo retorna un Future)
  // entonces como la lectura del json tarda, la propiedad opciones se llena con los datos despues que se hace la impresión

  // esto lo "soluciono" con el async y el await, pero"
  // las weas asyncronas dan problemas al usarse en constructores entonces mejor en lugar de llamar la propiedad opciones,
  // en la parte cuando requiero la informacion en la propiedad opciones,
  // en lugar de pedir la propiedad con el menuProvider.opciones voy a llamar al metodo que me retorna las opciones en un Future.
  // cargarData();
  }

  // utilizo el async y el await para que espere hasta que se termine de ejecutar el future,
  
  // una funcion asyncrona no puede retornar List<dynamic> sino un Futures,
  // hago que la vuncion retorne un Future<List<dynamic>>
  
   Future<List<dynamic>> cargarData() async {
    // para que archivos que no estan dentro de la carpeta lib, esten disponibles para la aplicacion,
    // toca enlazarlos en el archivo pubspec.yaml
    // en la parte de assets, para los recursos estaticos, es decir que no cambian durante la ejecucion de la app

    // rootBundle se importa de servcices, sirve para poder leer archivos json
    // el metodo loadString lee un archivo y lo regresa como un Future<String>
    // el await hace que se espere hasta que se resuelva el future y entonces guardo la respuesta en una variable
    // (la respuesta ya es un string)


    final respuesta = await rootBundle.loadString('data/menu_opts.json');

    // si me confundo, repasar los futures xD

   
      // para poder usar lo cargado del json no me sirve que sea un string, asi que lo paso a un Map
      // el objeto json se importa para poder usar el decode, que toma un string y si esta escrito en syntaxis json, lo pasa a un Map
      Map dataMap = json.decode(respuesta);
      // los datos del json que paso a la propiedad opciones son las rutas (una lista de mapas?)
      opciones = dataMap['rutas'];

      return opciones;
      //Listo ahora si cuando se ejecuta aeste metodo, se espera a que se llene la propiedad opciones y luego si la retorna
      //pero en un Future(? i'm confused :'v repasasr Futures, async y await
  }

  // El que regrese un Future es lo que busco xDD, porque ahora voy a usar en un stateless widget un Future.builder
  // que lo que hace es que el elemento se construya cuando se termina de procesar todo esta wea
}

final menuProvider = new _MenuProvider();
