import 'package:flutter/material.dart';

import 'package:practicaflutter/src/pages/alert_page.dart';
import 'package:practicaflutter/src/pages/avatar_page.dart';
import 'package:practicaflutter/src/pages/card_page.dart';
import 'package:practicaflutter/src/pages/home_page.dart';
import 'package:practicaflutter/src/pages/animated_container_page.dart';
import 'package:practicaflutter/src/pages/input_page.dart';
import 'package:practicaflutter/src/pages/slider_page.dart';
import 'package:practicaflutter/src/pages/listview_page.dart';

Map<String, WidgetBuilder> getApllicationRoutes(){
  
  return <String, WidgetBuilder>{
        '/'      : (BuildContext context) => HomePage(),
        'alert'  : (BuildContext context) => AlertPage(),
        'avatar' : (BuildContext context) => AvatarPage(),
        'card'   : (BuildContext context) => CardPage(),
        'inputs' : (BuildContext context) => InputPage(),
        'slider' : (BuildContext context) => SliderPage(),
        'list'   : (BuildContext context) => ListaPage(),
        'animatedContainer': (BuildContext context) => AnimatedContainerPage(),
  };
}