import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomePageTemp extends StatelessWidget {
  const HomePageTemp({Key key}) : super(key: key);

  static final opciones = [
    'Uno',
    'Dos',
    'Tres',
    'Cuatro',
    'Cinco',
    'Seis',
    'Siete'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Componentes temp'),
      ),
      body: ListView(
        // children: _crearItems(),
        children: _crearItemsCorta(),
      ),
    );
  }

  /*
  List<Widget> _crearItems() {
    List<Widget> lista = new List<Widget>();
    for (String opt in opciones) {
      final tempWidget = ListTile(
        title: Text(opt),
      );
      lista
        ..add(tempWidget)
        ..add(Divider(
          color: Colors.blue,
        ));
    }
    return lista;
  }*/

	List<Widget> _crearItemsCorta() {
		return opciones.map((item){
			return Column(
			  children: <Widget>[
			    ListTile(
			    	title: Text(item + '!'),
						subtitle: Text('Cualquier cosa'),
						leading: Icon(Icons.account_balance_wallet),
						trailing: Icon(Icons.keyboard_arrow_right),
						onTap: (){},
			    ),
					Divider()
			  ],
			);


		}).toList();
	}

}
