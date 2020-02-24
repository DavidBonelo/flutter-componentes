import 'package:flutter/material.dart';

import 'package:practicaflutter/src/providers/menu_provider.dart';
import 'package:practicaflutter/src/utils/icono_string_util.dart';

// import 'package:practicaflutter/src/pages/alert_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Componentes'),
      ),
      body: _lista(),
    );
  }

 Widget _lista() {

  // FutureBuilder Construye un Widget despues de esperar a que responda un Future y lo retorna
  return FutureBuilder(
    // el metodo cargarData trae un Future con la info del json
    future: menuProvider.cargarData(),
    initialData: [],
    builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot){
      return ListView(
        //snapshot.data saca la respuesta del future y lo mando al metodo que crea los items del ListView
        //mando tambien el context
        children: _listaItems(snapshot.data, context),
      );
    },
  );
 }

 List<Widget> _listaItems( List<dynamic> data, BuildContext context) {
   
   final List<Widget> opciones = [];

   data.forEach((opt){
     final widgetTemp = ListTile(
       title: Text(opt['texto']),
       leading: getIcon(opt['icon']),
       trailing: Icon(Icons.keyboard_arrow_right, color: Colors.blue,),
       // Funcion cuando se presiona un item del List View
       onTap: (){
         //Navegacion con nombres (?, hay que decirle a la aplicacion cuales rutas dispone en materialApp con el atributo routes
         Navigator.pushNamed(context, opt['ruta']);
         
         /*// para cambiar a otra page (forma basica)
         final route = MaterialPageRoute(
           builder: (context) => AlertPage()
           
           );
           // el context lo traje del future builder
         Navigator.push(context, route);*/
       },
       
     );
     opciones..add(widgetTemp)
              ..add(Divider());
   });
   return opciones;

 }

/* este es el ejemplo basico de un ListView, lo de arriba es para crear la lista leyendo un json
 Widget _lista() {

   return ListView(
     children: listaItems(),
   );
 }

 List<Widget> listaItems() {
   return [
     ListTile( title: Text('Hola Mundo'),),
     Divider(),
     ListTile( title: Text('Hola Mundo'),),
     Divider(),
     ListTile( title: Text('Hola Mundo'),),
     Divider(),
     ListTile( title: Text('Hola Mundo'),),
   ];

 }*/

}
