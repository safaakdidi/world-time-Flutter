import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:world_time/services/world_time.dart';
class Loading extends StatefulWidget {


  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  // String time='loading';


  void getData() async {


  Response response=await get(Uri.parse('https://jsonplaceholder.typicode.com/todos/1'));
  Map data=jsonDecode(response.body);
  print(data['title']);
  }

void setupworldtime() async{
  WorldTime ins=WorldTime(location: 'Tunis',flag: 'url.png',url:'/Africa/Tunis');
  await  ins.getTime();
  Navigator.pop(context,{
    'location':ins.location,
    'time':ins.time,
    'flag':ins.flag,
    'isDaytime':ins.isDaytime
  });

  // print(ins.time);
  // setState(() {
  //   time=ins.time;
  // });
}



  @override
  void initState() {

    super.initState();
 //   getData();
    setupworldtime();


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor:Colors.blue[900],
      body: Center(

        child: SpinKitSpinningLines(
          color: Colors.white,
          size: 50.0,
        ),
      )
    );
  }
}
