import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:ohlonehackssubmission/pages/home.dart';

class Achievements extends StatefulWidget {
  @override
  _AchievementsState createState() => _AchievementsState();
}

class _AchievementsState extends State<Achievements> {
  List<IconData> achievementIcons = [Icons.directions_run,
    Icons.directions_run,
    Icons.directions_run,
    Icons.directions_run,
    Icons.directions_run,
    Icons.directions_run,
    Icons.directions_run,
    Icons.directions_run,
    Icons.directions_run,
    Icons.directions_run,
    Icons.directions_run,];
  List<bool> achieved = [true,true,true,true,true,true,false,false,false,false,false];
  List<String> achievementDescription = ['Walk 10 steps',
    'Walk 10 steps',
    'Walk 10 steps',
    'Walk 10 steps',
    'Walk 10 steps',
    'Walk 10 steps',
    'Walk 10 steps',
    'Walk 10 steps',
    'Walk 10 steps',
    'Walk 10 steps',
    'Walk 10 steps'];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: (){
            Navigator.pop(context);
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) => Home(index: 1)
              )
            );
          },
        ),
      ),
      body: GridView.builder(
          itemCount: 11,
          padding: EdgeInsets.all(8),
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 150
          ),
          itemBuilder: (BuildContext context, int index){
            return Card(
              color: achieved[index] ? Colors.blue : Colors.grey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  achieved[index] ? Icon(achievementIcons[index]) : Icon(Icons.lock_outline),
                  Divider(),
                  Text(achieved[index]? achievementDescription[index]: '?????')
                ],
              ),
            );
          },
        ),


    );
  }
}

