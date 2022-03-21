import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {

  String location;
  String time='';
  String flag;
  String url;
  bool isDaytime=true;


  WorldTime({required this.location,required this.flag,required this.url});
  Future<void> getTime() async {
    try {
      Response res = await get(
          Uri.parse('http://worldtimeapi.org/api/timezone/$url'));
      Map data = jsonDecode(res.body);
      //print(data);
      //get properties from data
      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(1, 3);
      //print(datetime);
      //print(offset);
      //create a date time object
      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));
      //set time property
      isDaytime=now.hour>=6&&now.hour<=18?true:false;
      time = DateFormat.jm().format(now);

      //print(now);


    }catch (e) {
      print('caught error $e');
      time='could not get time data';
    }
  }



}
