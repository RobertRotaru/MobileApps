import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  List<WorldTime> locations = [
    WorldTime(url: "Europe/Amsterdam", location: "Amsterdam", flag: "amsterdam.png"),
    WorldTime(url: "Europe/Copenhagen", location: "Copenhagen", flag: "copenhagen.png"),
    WorldTime(url: "Europe/London", location: "London", flag: "london.png"),
    WorldTime(url: "Europe/Paris", location: "Paris", flag: "paris.png"),
    WorldTime(url: "Europe/Berlin", location: "Berlin", flag: "berlin.png"),
    WorldTime(url: "Europe/Bucharest", location: "Bucharest", flag: "bucharest.png"),
    WorldTime(url: "Europe/Rome", location: "Rome", flag: "rome.png"),
    WorldTime(url: "Europe/Madrid", location: "Madrid", flag: "madrid.png"),
    WorldTime(url: "Europe/Lisbon", location: "Lisbon", flag: "lisbon.png"),
    WorldTime(url: "Europe/Budapest", location: "Budapest", flag: "budapest.png"),
    WorldTime(url: "America/New_York", location: "New York", flag: "new_york.png"),
    WorldTime(url: "America/Chicago", location: "Chicago", flag: "chicago.png"),
    WorldTime(url: "America/Los_Angeles", location: "Los Angeles", flag: "los_angeles.png"),
    WorldTime(url: "America/Santiago", location: "Santiago", flag: "santiago.png"),
    WorldTime(url: "America/Sao_Paolo", location: "Sao Paolo", flag: "sao_paolo.png"),
    WorldTime(url: "Africa/Cairo", location: "Cairo", flag: "cairo.png"),
    WorldTime(url: "Africa/Casablanca", location: "Casablanca", flag: "casablanca.png"),
    WorldTime(url: "Africa/Johannesburg", location: "Johannesburg", flag: "johannesburg.png"),
    WorldTime(url: "Asia/Bangkok", location: "Bangkok", flag: "bangkok.png"),
    WorldTime(url: "Asia/Dubai", location: "Dubai", flag: "dubai.png"),
    WorldTime(url: "Asia/Hong_Kong", location: "Hong Kong", flag: "hong_kong.png"),
    WorldTime(url: "Asia/Jerusalem", location: "Jerusalem", flag: "jerusalem.png"),
    WorldTime(url: "Asia/Dakar", location: "Dakar", flag: "dakar.png"),
    WorldTime(url: "Asia/Seoul", location: "Seoul", flag: "seoul.png"),
    WorldTime(url: "Asia/Shanghai", location: "Shanghai", flag: "shanghai.png"),
    WorldTime(url: "Asia/Singapore", location: "Singapore", flag: "singapore.png"),
    WorldTime(url: "Asia/Taipei", location: "Taipei", flag: "taipei.png"),
    WorldTime(url: "Asia/Tokyo", location: "Tokyo", flag: "tokyo.png"),
    WorldTime(url: "Atlantic/Canary", location: "Canary", flag: "canary.png"),
    WorldTime(url: "Australia/Melbourne", location: "Melbourne", flag: "melbourne.png"),
    WorldTime(url: "Australia/Sydney", location: "Sydney", flag: "sydney.png"),
    WorldTime(url: "Indian/Mauritius", location: "Mauritius", flag: "mauritius.png"),
    WorldTime(url: "Pacific/Fiji", location: "Fiji", flag: "fiji.png"),
    WorldTime(url: "Pacific/Funafuti", location: "Funafuti", flag: "funafuti.png"),
  ];

  void updateTime(index) async {
    WorldTime instance = locations[index];
    await instance.getTime();

    // navigate to home screen
    Navigator.pop(context, {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDayTime': instance.isDayTime
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text("Choose a location"),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
            child: Card(
              child: ListTile(
                onTap: () {
                  updateTime(index);
                },
                title: Text(locations[index].location),
                leading: CircleAvatar(
                  backgroundImage: AssetImage('assets/${locations[index].flag}'),
                ),
              ),
            ),
          );
        }
      ),
    );
  }
}
