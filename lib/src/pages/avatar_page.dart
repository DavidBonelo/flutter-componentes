import 'package:flutter/material.dart';

class AvatarPage extends StatelessWidget {
  const AvatarPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Avatar Page'),
        actions: <Widget>[
          Container(
            padding: EdgeInsets.all(8.0),
            // margin: EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundColor: Colors.black,
              // radius: 20.0,
              backgroundImage: NetworkImage('https://img-cdn.hipertextual.com/files/2018/11/Stan-Lee.jpg'),
              
            ),
          ),
          Container(
            margin: EdgeInsets.all(8.0),
            child: CircleAvatar(
              child: Text('SL'),
              backgroundColor: Colors.orangeAccent,
              foregroundColor: Colors.white,
            ),
          )
        ],
      ),
      body: Center(
        child: FadeInImage(
          fadeInDuration: Duration(milliseconds: 300),
          placeholder: AssetImage('assets/jar-loading.gif'), image: NetworkImage('https://img-cdn.hipertextual.com/files/2018/11/Stan-Lee.jpg')),
      ),
    );
  }
}