import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';
class ChooseLocation extends StatefulWidget {

  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  List<WorldTime> locations = [
    WorldTime(url: 'Europe/London', location: 'London', flag: 'uk.png'),
    WorldTime(url: 'Europe/Berlin', location: 'Athens', flag: 'greece.png'),
    WorldTime(url: 'Africa/Cairo', location: 'Cairo', flag: 'egypt.png'),
    WorldTime(url: 'Africa/Nairobi', location: 'Nairobi', flag: 'kenya.png'),
    WorldTime(url: 'America/Chicago', location: 'Chicago', flag: 'usa.png'),
    WorldTime(url: 'America/New_York', location: 'New York', flag: 'usa.png'),
    WorldTime(url: 'Asia/Seoul', location: 'Seoul', flag: 'south_korea.png'),
    WorldTime(url: 'Asia/Jakarta', location: 'Jakarta', flag: 'indonesia.png'),
  ];

/*void getData() async {
  //simulate network request for a username
  String user=await Future.delayed(Duration(seconds: 3),(){
    return 'safa';
  });
  //simulate network request for a user bio
 String bio=await Future.delayed(Duration(seconds: 2),()
  {
    return 'bio';
  });
 print('$user - $bio');
}
//init function runs ml lawl bark
  @override
  void initState() {

    super.initState();
    print('init');
    getData();
    print('jhdfkj');
  }*/

//build function reruns every time we change the state
  @override
  Widget build(BuildContext context) {

    print('build');
    return Scaffold(
          backgroundColor: Colors.grey[200],
          appBar: AppBar(
            backgroundColor: Colors.blue[900],
            title: Text('Choose a Location'),
            centerTitle: true,
            elevation: 0,
          ),
          body:ListView.builder(
            itemCount: locations.length,
            itemBuilder: (contex,index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical:1.0,horizontal: 4.0 ),
                child: Card(
                  child: ListTile(
                    onTap: () async{
                      await locations[index].getTime();
                      Navigator.pushReplacementNamed(context, '/home',arguments: {
                        'location':locations[index].location,
                        'time':locations[index].time,
                        'flag':locations[index].flag,
                        'isDaytime':locations[index].isDaytime
                      });
                    },
                    title: Text(locations[index].location),
                    leading: CircleAvatar(
                      backgroundImage: AssetImage('assets/${locations[index].flag}'),
                    ),
                  ),
                ),
              );
            },
          )
          
          );

  }
}
