import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';
class WorldTime
{
  String location;
  String url;
  String time;
  String flag;
  bool dark;
  WorldTime({this.location,this.flag,this.url});
  Future <void> getTime() async
  {
    try {
      Response response = await get(
          'http://worldtimeapi.org/api/timezone/$url');
      Map data = jsonDecode(response.body);
      String offset = data['utc_offset'].substring(1, 3);
      String datetime = data['datetime'];
      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));
      time = DateFormat.jm().format(now);
      dark = now.hour>20 || now.hour <6 ? true:false;

    }

  catch(e)
    {
    print(e);
    time = 'Not found due to errors';
    }
  }

}