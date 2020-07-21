import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};
  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty? data: ModalRoute.of(context).settings.arguments;
    Color background = data['dark']? Colors.black:Colors.white;
    Color text = data['dark']? Colors.white:Colors.black;

    return Scaffold(
      backgroundColor: background,
      body: SafeArea(
        child: Padding(
          padding : EdgeInsets.fromLTRB(20.0,180.0, 20.0, 0.0),
          child: Column(

            children: <Widget>[
              FlatButton.icon(
            onPressed: () async {
             dynamic result =  await Navigator.pushNamed(context, '/b');

             setState(() {
               data = {
                 'location' : result['location'],
                 'time': result['time'],
                 'flag': result['flag'],
                 'dark' : result['dark'],

               };
             });

            },
    icon: Icon(Icons.edit_location,
    color: text,),
                label: Text('Edit',
                style: TextStyle(
                  color: text,
                ))
              ),
              Column(

                children: <Widget>[
                  Center(
                    child: Text(data['location'],
                    style: TextStyle(
                      fontSize: 40.0,
                      color: text,
                    ),),
                  ),
                  SizedBox(height:20),
                  Center(
                    child: Text(data['time'],
                    style: TextStyle(
                      fontSize: 60.0,
                      color: text,
                    ),),
                  )
                ],
              ),

            ],
          ),
        ),
      )
    );
  }
}

    