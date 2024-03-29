import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {

  String location; // location name for the UI
  String time; // time in that location
  String flag; // url to an asset flag icon
  String url; // location url for api endpoint
  bool isDayTime; // true or false if day time or not

  WorldTime({ this.location, this.flag, this.url});

  Future<void> getTime() async {

    try {
      Response response = await get("http://worldtimeapi.org/api/timezone/$url");
      Map data = jsonDecode(response.body);
      //print(data);

      String dateTime = data["datetime"];
      String offset = data["utc_offset"].substring(1, 3);
      int noHours = int.parse(offset) * (data["utc_offset"][0] == '-' ? -1 : 1);
      //print(dateTime);
      //print(offset);

      DateTime now = DateTime.parse(dateTime);
      now = now.add(Duration(hours: noHours));

      isDayTime = now.hour > 6 && now.hour < 20 ? true : false;
      time = DateFormat.jm().format(now); // sets the time property
    }
    catch (e) {
      print('caught error: $e');
      time = 'could not get time data';
    }

  }

}

