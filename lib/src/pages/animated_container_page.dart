//TODO: Arreglar la identacion que se volvió loca
import 'package:flutter/material.dart';

import 'dart:math'; //para el random

class AnimatedContainerPage extends StatefulWidget {
  @override
  _AnimatedContainerPageState createState() => _AnimatedContainerPageState();
}

class _AnimatedContainerPageState extends State<AnimatedContainerPage> {
  double _width = 50.0;
  double _height = 50.0;
  Color _color = Colors.pink;

  BorderRadiusGeometry _borderRadius = BorderRadius.circular(8.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Animated Container'),
        ),
        body: Center(
            child: AnimatedContainer(
          duration: Duration(seconds: 1),
          curve: Curves.fastOutSlowIn,
          width: _width,
          height: _height,
          decoration: BoxDecoration(
            borderRadius: _borderRadius,
            color: _color,
          ),
        )),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.play_arrow),
          onPressed: _cambiarForma,
        ));
  }

  void _cambiarForma() {
    setState(() {
      //asigno valores random a las variables para el container
      final random = Random();
      _width = random.nextInt(350).toDouble();
      _height = random.nextInt(350).toDouble();
      _color = Color.fromRGBO(
          random.nextInt(255), random.nextInt(255), random.nextInt(255), 1);

      _borderRadius = BorderRadius.circular(random.nextInt(200).toDouble());
    });
  }
}
