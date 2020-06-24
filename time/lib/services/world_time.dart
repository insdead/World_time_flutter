import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';


// instance.getTime(); pass data with variable instance then the constructor get this values and get the time of the country
class WorldTime {
  String location;
  String time;
  String url;
  String flag;
  bool isDaytime; 
  WorldTime({this.flag, this.location, this.url});

  Future<void> getTime() async {

    try {
      Response response = await get('http://worldtimeapi.org/api/timezone/$url');
      Map data = jsonDecode(response.body);

      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(1,3);

      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));

      isDaytime = now.hour > 6 && now.hour < 20 ? true : false;
      time = DateFormat.jm().format(now);


    } catch (e) {
      print(e);
    }

  }

}