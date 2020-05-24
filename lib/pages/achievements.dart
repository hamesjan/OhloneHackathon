import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:ohlonehackssubmission/pages/home.dart';

class Achievements extends StatefulWidget {
  @override
  _AchievementsState createState() => _AchievementsState();
}

class _AchievementsState extends State<Achievements> {
  List<IconData> achievementIcons = [
    Icons.sentiment_very_dissatisfied,
    Icons.sentiment_very_dissatisfied,
    Icons.sentiment_neutral,
    Icons.sentiment_satisfied,
    Icons.sentiment_satisfied,
    Icons.sentiment_very_satisfied,
    Icons.directions_run,
    Icons.airplanemode_active,
    Icons.map,
    Icons.fastfood,
    Icons.fastfood,
    Icons.trending_down,
    Icons.trending_down,
    Icons.trending_down,
    Icons.trending_down,];
  List<bool> achieved = [true,true,true,false,false,false,false,false,false,true,true,false,false,false,false];
  List<String> achievementDescription = [
    'Walk 10 steps',
    'Walk 100 steps',
    'Walk 1,000 steps',
    'Walk 10,000 steps',
    'Walk 100,000 steps',
    'Walk 1,000,000 steps',
    'Walk 10,000,000 steps',
    'Walk 100,000,000 steps',
    'Walk 1,000,000,000 steps',
    'Eat a meal that is less than 500 calories.',
    'Eat less than 2500 calories in a day.',
    'Lose 5 pounds in a week',
    'Lose 1 pound in a day',
    'Lose 10 pounds in a month',
    'Lose 20 pounds in a month'
  ];

  List<String> achievementName = [
    'Baby Steps',
    'Toddler',
    'Teen',
    'Track Team Anchor',
    'Cross Country Star',
    'Marathon Man',
    'Forrest Gump',
    'Earth Voyager',
    'Planet Explorer',
    'Snack',
    'Hungry but Worth It',
    'You can DO it!',
    'Nice!',
    'Amazing!',
    'Goal-Reacher'
  ];

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
          itemCount: 15,
          padding: EdgeInsets.all(8),
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 150
          ),
          itemBuilder: (BuildContext context, int index){
            return Card(
              color: achieved[index] ? Colors.blue : Colors.grey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  achieved[index] ? Icon(achievementIcons[index]) : Icon(Icons.lock_outline),
                  Divider(),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(achieved[index]?achievementName[index]: '???', textAlign: TextAlign.center, style: TextStyle(
                        color: Colors.yellowAccent,
                        fontSize: 15,
                        fontWeight: FontWeight.bold
                      ),),
                      Text(achieved[index]? achievementDescription[index]: '???????', textAlign: TextAlign.center, style: TextStyle(
                        fontSize: 12
                      ),)

                    ],
                  )
                ],
              ),
            );
          },
        ),


    );
  }
}

