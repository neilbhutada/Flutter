import 'package:flutter/material.dart';
import 'package:realone/services/worldtime.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  String time = 'loading';
void setTime() async
{

  WorldTime instance = WorldTime(location:'London',flag:'England.png',url: 'Europe/London');
  await instance.getTime();
  Navigator.pushReplacementNamed(context,'/a',arguments: {
    'location' : instance.location,
    'time': instance.time,
    'flag': instance.flag,
    'dark' : instance.dark,
  });



}
  @override0
  void initState() {
    // TODO: implement initState
    super.initState();

    setTime();
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.black12,
      body: SpinKitDualRing(
        color: Colors.white,
        size: 190.0,
      )
    );
  }
}
