import 'package:flutter/material.dart';

import 'package:practicaflutter/src/pages/alert_page.dart';
import 'package:practicaflutter/src/pages/avatar_page.dart';
import 'package:practicaflutter/src/pages/home_page.dart';

Map<String, WidgetBuilder> getApllicationRoutes(){
  
  return <String, WidgetBuilder>{
        '/' : (BuildContext context) => HomePage(),
        'alert' : (BuildContext context) => AlertPage(),
        'avatar' : (BuildContext context) => AvatarPage(),
      };
}