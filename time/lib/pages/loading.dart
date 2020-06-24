import 'package:flutter/material.dart';
import 'package:time/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  
  void setWorldTime() async {
    WorldTime instanse = WorldTime(location: 'Berlin', url: 'Europe/Berlin', flag: 'germany.png');
    await instanse.getTime();
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': instanse.location,
      'flag': instanse.flag,
      'time': instanse.time,
      'isDaytime': instanse.isDaytime
    });
  }
  
  @override
  void initState() {
    super.initState();
    setWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: Center(
        child: SpinKitRotatingPlain(
          color: Colors.white,
          size: 50.0,
        ),
      ),
    );
  }
}





















