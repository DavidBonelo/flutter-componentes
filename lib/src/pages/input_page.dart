import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  String _nombre    = '';
  String _email     = '';
  String _password  = '';
  String _fecha     = '';

  String _opcionSeleccionada = 'Poder';

  List<String> _poderes = ['Poder','Volar', 'Rayos X', 'Super Aliento', 'Super Fuerza' ];

  // sirve para cambiar el texto en el imput field
  TextEditingController _inputFieldDateController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inputs de texto'),
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: <Widget>[
          _crearInputs(),
          Divider(),
          _crearEmailInput(),
          Divider(),
          _crearPasswordInput(),
          Divider(),
          _crearDateInput(context),
          Divider(),
          _crearDropdown(context),
          Divider(),
          _crearPersona(),
        ],
      ),
    );
  }

  Widget _crearInputs() {

    return TextField(
      // autofocus: true,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        counter: Text('Letras ${_nombre.length}'),
        hintText: 'Nombre de la persona',
        labelText: 'Nombre',
        helperText: 'Solo es el nombre',
        suffixIcon: Icon(Icons.accessibility_new),
        icon: Icon(Icons.account_circle),
        prefixIcon: Icon(Icons.account_box),
        // ver las implementaciones del ImputBorder (clase abstacta) en la doc
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),

      ),
      onChanged: (valor){
        setState(() { 
        _nombre = valor;
        });
      },
    );
  }


  Widget _crearEmailInput(){

    return TextField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        hintText: 'e-mail',
        labelText: 'e-mail',
        suffixIcon: Icon(Icons.alternate_email),
        prefixIcon: Icon(Icons.email),
        // ver las implementaciones del ImputBorder (clase abstacta) en la doc
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),

      ),
      onChanged: (valor) =>setState(()=>_email = valor)
    );
  }
  Widget _crearPasswordInput(){

    return TextField(
      obscureText: true,
      decoration: InputDecoration(
        hintText: 'Contraseña',
        labelText: 'Contraseña',
        prefixIcon: Icon(Icons.vpn_key),
        suffixIcon: Icon(Icons.lock),
        // ver las implementaciones del ImputBorder (clase abstacta) en la doc
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),

      ),
      onChanged: (valor) => setState(()=> _password = valor),
    );
  }

  Widget _crearDateInput(BuildContext context){

    return TextField(
      enableInteractiveSelection: false,
      controller: _inputFieldDateController,
      decoration: InputDecoration(
        hintText: 'Fecha de nacimiento',
        labelText: 'Fecha de nacimiento',
        prefixIcon: Icon(Icons.calendar_today),
        suffixIcon: Icon(Icons.perm_contact_calendar),
        // ver las implementaciones del ImputBorder (clase abstacta) en la doc
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),

      ),
      onTap: (){
        // para que no se ponga en foco el textfield y el usuario pueda escribir en el
        FocusScope.of(context).requestFocus(new FocusNode());
        _datePicker(context);
      },
    );
  }

  _datePicker(BuildContext context) async {
    // showDatePicker devuelve un future, entonces toca async y await para esperar a que se resuelva y devuelva el DateTime

    DateTime pickedDate = await showDatePicker(
      context: context,
      // idioma español
      locale: Locale('es','ES'),
      // para que la fecha al abir sea hace 18 años xD
      initialDate: new DateTime(new DateTime.now().year - 18),
      firstDate: new DateTime(1900),
      lastDate: new DateTime.now(),
      );

      if (pickedDate != null) {
        setState(() {
          // tostring pasa todo, horas, minutos y segundos
          // el profe no explica como quitar h,m,s
          // _fecha = pickedDate.toString();
          // intento de arreglar el tostring pero los num de 1 digito no quedan con el 0 antes
          _fecha = '${pickedDate.year}/${pickedDate.month}/${pickedDate.day}';
          _inputFieldDateController.text = _fecha;
        });
      }
  }
  
  List<DropdownMenuItem<String>> getOpcionesDropdown() {
    
    List<DropdownMenuItem<String>> lista = new List();

    _poderes.forEach((poder){
      lista.add(DropdownMenuItem(
        child: Center(child: Text(poder)),
        value: poder,
      ));

    });

    return lista;
  }

  Widget _crearDropdown(BuildContext context) {

     return Row(
       children: <Widget>[
         Icon(Icons.select_all),
         SizedBox(width: 20.0),
         Expanded(
          child: DropdownButton(
            isExpanded: true,
            value: _opcionSeleccionada,

            items: getOpcionesDropdown(),
            hint: Text('Selecciona el poder'),
            //
            // selectedItemBuilder: (BuildContext context)=> getOpcionesDropdown(),
            onChanged: (opt){
              setState(() => _opcionSeleccionada = opt);
            },
          ),
         )

       ],
     );
  }

  ListTile _crearPersona() {
    return ListTile(
      title: Text('Nombre es: $_nombre'),
      subtitle: Text('e-mail: $_email y contraseña: $_password'),
      trailing: Text('Poder: $_opcionSeleccionada'),
    );
  }
}