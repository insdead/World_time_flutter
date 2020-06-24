import 'package:flutter/material.dart';
import 'package:time/pages/choose_location.dart';
import 'package:time/pages/home.dart';
import 'package:time/pages/loading.dart';

void main() => runApp(MaterialApp(
  initialRoute: '/loading',
  routes: {
    '/loading' : (context) => Loading(),
    '/home' : (context) => Home(),
    '/location' : (context) => ChooseLocation(),
  },
));