import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {
  const CardPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cards'),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
        children: <Widget>[
          _cardTipo1(),
          SizedBox(height: 30.0,),
          _cardTipo2(),
          SizedBox(height: 30.0,),
          _fakecard(),
        ],
      ),
    );
  }

  Card _cardTipo1() {
    return Card(
      elevation: 10.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      child: Column(
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.photo_album, color: Colors.blue,),
            title: Text('Soy el titulo de esta tarjera'),
            subtitle: Text('Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              FlatButton(onPressed: (){}, child: Text('Cancelar')),
              FlatButton(onPressed: (){}, child: Text('OK')),
            ],
          ),
        ],
      ),
    );
  }

  Card _cardTipo2() {

    return Card(
      //arregla que la imagen no respete los bordes redondos
      clipBehavior: Clip.antiAlias,
      //cambia la forma de la tarjeta, para ver cuales hay, ver en la doc
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40.0)),
      child: Column(
        children: <Widget>[
          // Imagen con placeholder mientras carga
          FadeInImage(
            height: 300.0,
            fit: BoxFit.cover,
            fadeInDuration: Duration(milliseconds: 200),
            placeholder: AssetImage('assets/jar-loading.gif'),
            //Imagen grande, pesada y traida desde internet para practicar la carga de imagenes en la app
            image: NetworkImage('https://www.tom-archer.com/wp-content/uploads/2018/06/milford-sound-night-fine-art-photography-new-zealand.jpg'),
          ),
          // Forma basica de mostrar imagen, no aparece nada hasta que carga
          // Image(
          //   image: NetworkImage('https://www.tom-archer.com/wp-content/uploads/2018/06/milford-sound-night-fine-art-photography-new-zealand.jpg'),
          // ),
          Container(
            padding: EdgeInsets.all(20.0),
            child: Text('No tengo idea de que poner')
            ),
        ],
      ),
    );
  }

  Widget _fakecard() {

    return Container(
      decoration: BoxDecoration(
        // color: Colors.lightGreenAccent,
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(20.0)),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black26,
            offset: Offset(5.0, 5.0),
            blurRadius: 10.0,
          )
        ],

      ),

      child: ClipRRect(//arregla que la imagen no respete los bordes poniendole bordes xd
        borderRadius: BorderRadius.circular(20.0),
        child: Column(
          children: <Widget>[
            Container(
              // color: Colors.blueGrey,
              child: FadeInImage(
                // height: 400.0,
                height: 300.0,
                // fit: BoxFit.contain,
                fit: BoxFit.cover,
                placeholder: AssetImage('assets/jar-loading.gif'),
                image: NetworkImage('https://www.tom-archer.com/wp-content/uploads/2018/06/milford-sound-night-fine-art-photography-new-zealand.jpg')),
            ),
            Container(
              padding: EdgeInsets.all(20.0),
              // color: Colors.red,
              child: Text('ola k ase'),
            )
          ],
        ),
      ),
    );
  }
}