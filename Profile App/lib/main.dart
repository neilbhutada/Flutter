import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  home: Demo()
));

class Demo extends StatefulWidget {
  @override
  _DemoState createState() => _DemoState();
}

class _DemoState extends State<Demo> {
  dynamic level = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('ID Card',
           style: TextStyle(
            color: Colors.white,
        ),),
        backgroundColor: Colors.red,
        centerTitle: true,

      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          setState(() {
            if(level>=6)
              {
                level = 'Pathway Completed';
              }
            else
              {
                level+=0.25;
              }
          });
        },
        child: Icon(
          Icons.add
        ),
        backgroundColor: Colors.red,
      ),

      body: Padding(
        padding: EdgeInsets.fromLTRB(40.0, 40.0, 40.0, 0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/face.png'),
                radius: 60.0,
              ),
            ),
            Divider(
              height: 60.0,
                  color: Colors.black
            ),
            Text('NAME:'
         ),
            SizedBox(height:10.0),
            Text('Neil Bhutada',
              style: TextStyle(
                fontSize: 25.0,
                color: Colors.amber[800],
                fontWeight: FontWeight.bold
              ),

            ),
            SizedBox(height: 30),
            Text('CURRENT PATHWAY LEVEL:'
            ),
            SizedBox(height:10.0),
            Text('$level',
              style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.amber[800],
                  fontWeight: FontWeight.bold
              ),

            ),
            SizedBox(height:30),
            Row(
                children: <Widget> [ Icon(
              Icons.phone,
              color: Colors.amber[800],
            ),
            SizedBox(width: 10.0),
            Text('+91 7558390333',
            style: TextStyle(
              letterSpacing: 1.0
            )
            )
           ]
            )


          ],
        )

      )

    );
  }
}
