import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {

  double _valorSlider = 200.0;
  bool _bloquearCheck = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Slider'),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 50.0),
        child: Column(
          children: <Widget>[
            _crearSlider(),
            _checkBox(),
            _crearSwitch(),
            Expanded(child: _crearImagen()),
          ],
        ),
      ),
    );
  }

  Widget _crearSlider(){
    
    return Slider(
      activeColor: Colors.indigoAccent,
      inactiveColor: Colors.red,
      // el label solo aparece cuando hay divisiones(?
      // label: 'Tamaño de la imagen: $_valorSlider',
      value: _valorSlider,
      min: 10.0,
      max: 400.0,
      // si el onchanged es null, se ve como desactivado el slider
      // if resumido (condicion) ? whentrue : whenfalse
      onChanged: (_bloquearCheck) ? null : ( valor ){
        setState(()=>_valorSlider = valor);
      },
    );

  }

  Widget _checkBox(){

    // return Checkbox(
    //   value: _bloquearCheck,
    //   onChanged: (valor){
    //     setState(() {
    //       _bloquearCheck = valor;
    //     });
    //   },
    // );
    return CheckboxListTile(
      // ubicacion del checkbox respecto al titulo
      // TODO: hacer que el checkbox este pegado a la derecha del texto
      controlAffinity: ListTileControlAffinity.trailing,
      // hace que se coloree el texto cuando se activa el checkbox
      selected: _bloquearCheck,
      title: Text('Bloquear slider'),      
      value: _bloquearCheck,
      onChanged: (valor){
        setState(() {
          _bloquearCheck = valor;
        });
      },
    );
  }

  Widget _crearSwitch(){

    return SwitchListTile(
      title: Text('Bloquear slider'),
         
      selected: _bloquearCheck,
      value: _bloquearCheck,
      onChanged: (valor){
        setState(() {
          _bloquearCheck = valor;
        });
      },
    );

    
  }

  Widget _crearImagen(){

    return Container(
      padding: EdgeInsets.all(20.0),
      color: Colors.red,
      child: Image(
        width: _valorSlider,
        image: AssetImage('assets/jar-loading.gif')
      )
    );

  }
}