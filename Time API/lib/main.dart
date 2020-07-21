import 'package:flutter/material.dart';
import 'package:realone/pages/home.dart';
import 'package:realone/pages/choose_location.dart';
import 'package:realone/pages/loading.dart';
void main() => runApp(MaterialApp(
//initialRoute: '/a',
  routes: {
    '/' : (context)=>Loading(),
'/a': (context)=> Home(),
'/b' : (context)=>Choose_Location()

},
));

