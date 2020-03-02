import 'dart:async';

import 'package:flutter/material.dart';

class ListaPage extends StatefulWidget {
  @override
  _ListaPageState createState() => _ListaPageState();
}

class _ListaPageState extends State<ListaPage> {

  // controller para poder detectar cuando el usuario hace scroll hasta el final de la lista, se asigna al ListView.Builder
  // el controller hay que desecharlo cuando se destruya la pagina
  ScrollController _scrollController = new ScrollController();

  // lista para los items del listview, iniciada vacia, en el init stale le agrego 10 items
  List<int> _listaNumeros = new List();
  // variable para guardar el ultimo item de la lista
  // lo utilizo en el metodo agregar 10 
  int _ultimoItem = 0;
  bool _isLoading = false;

  // metodo que ejecuta algo, apenas se crea el estado inicial
  @override
  void initState() {
    super.initState();

    _agregar10();

    _scrollController.addListener((){
      // verifica si la posicion del scroll es la posicion final
      if ( _scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
        // cambio el _agregar10 porque en situacion real el traer los registros(rutas de las imagenes, no la imagen en si) por una peticion http tardaria en dar resultados
        // creo un metodo que agrega los registros a la lista despues de un rato y trabajando con futures
        // tambien pongo una animacion mientras se traen los registros 
        
        // _agregar10();
        _fetchData();
        
      }
    });

  }

  // lo que se ejecuta cuando se destruye la pagina
  @override
  void dispose() {
    super.dispose();
    // desecha el controller
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Listas')
        ),
        // Stack es para ubicar widgets encima de otros
      body: Stack(
        children: <Widget>[
          _crearLista(),
          _crearLoading(),
        ],
      ),
    );
  }

  Widget _crearLista(){

    // RefreshIndicator para el pull to refresh
    // Puede usarse solo con hijos que tengan scroll (?

    return RefreshIndicator(
      onRefresh: _refreshList ,
          child: ListView.builder(
        // enlaza el controlador del scroll
        controller: _scrollController,
        // listanumeros no puede ser null en el estado inicial o da error por el .length
        // total de items de la lista, debe ponerse siempre
        itemCount: _listaNumeros.length,
        // el builder retorna widgets la cantidad puesta en itemCount
        itemBuilder: (BuildContext context, int index){
          // index: la posicion del item que se esta construyendo
          // me da el dato que contiene la lista, en este ejemplo como la lista son numeros parece raro xd
          final imagen = _listaNumeros[index];
          // picsum: servicio web que provee imagenes para relleno
          return FadeInImage(
            
            // image: NetworkImage('https://picsum.photos/500/300/?image=2'),
            image: NetworkImage('https://picsum.photos/500/300/?image=$imagen'),
            placeholder: AssetImage('assets/jar-loading.gif'),
          );

        },
      ),
    );

  }

  Future<Null> _refreshList() async {
      final duration = new Duration(seconds: 2);
      
        _listaNumeros.clear();
        _ultimoItem++;
        _agregar10();

      return Future.delayed(duration);
  }

  void _agregar10(){
    for (int i = 1; i<10; i++){
      _ultimoItem++;
      _listaNumeros.add(_ultimoItem);
      setState(() {});

    }
  }

  // Es bueno siempre definir el tipo del future, en este caso como no retorna nada por ser una prueba entonces es null
  // el poner null da error, al parecer el new Timer retorna algo?
  Future _fetchData() async {
    // delay simulado :v
    _isLoading = true;
    setState(() {});

    final duration = new Duration( seconds: 2);

    return new Timer(duration, respuestaHTTP);

  }

  void respuestaHTTP(){

    _isLoading = false;
    _agregar10();

    _scrollController.animateTo(
      _scrollController.position.pixels + 100,
      duration: Duration(milliseconds: 300),
      curve: Curves.fastOutSlowIn);
  }

  Widget _crearLoading(){
    if (_isLoading) {
      return Container(
        // color: Colors.green,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Center(child: CircularProgressIndicator()),
            SizedBox(height: 16.0),
          ],
        ),
      );
    } else {
      // hay que retornar algo, asi que un contenedor vacio :v
      return Container();
    }
  }
}