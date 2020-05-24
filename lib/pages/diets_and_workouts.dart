import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:ohlonehackssubmission/pages/home.dart';
import 'package:url_launcher/url_launcher.dart';

class DietsWorkouts extends StatefulWidget {
  @override
  _DietsWorkoutsState createState() => _DietsWorkoutsState();
}

class _DietsWorkoutsState extends State<DietsWorkouts> {
  List<IconData> achievementIcons = [Icons.fitness_center,
    Icons.fitness_center,
    Icons.fitness_center,
    Icons.fitness_center,
    Icons.fastfood,
    Icons.fastfood,
    Icons.fastfood,
    Icons.fastfood,
    Icons.fastfood,
    Icons.fastfood,
    Icons.fitness_center,
    Icons.fitness_center,
    Icons.fitness_center,
    Icons.fitness_center,
    Icons.fitness_center,];


  List<String> achievementName = ['10 minute Ab Workout',
    '12 minute Leg Workout',
    '14 minute Bicep Workout',
    '10 minute Back Workout',
    'Weight Loss Diet',
    'Mediterranean Diet',
    'Dash Diet',
    'Flexitarian Diet',
    'Weight Watchers Diet',
    'Mayo Clinic Diet',
    'Running Workout',
    '20 minute Core Workout',
    'How To Lose Weight',
    'How To Live an Active Lifestyle',
    'General Workouts',
  ];

  List<String> workoutURl = ['https://www.youtube.com/watch?v=1919eTCoESo',
    'https://www.youtube.com/watch?v=Fu_oExrPX68',
    'https://www.youtube.com/watch?v=gozU3CUIizs',
    'https://www.youtube.com/watch?v=JAuNs5FnAOU',
    'https://www.youtube.com/watch?v=CxktmQ3zJOA',
    'https://health.usnews.com/best-diet/mediterranean-diet',
    'https://health.usnews.com/best-diet/dash-diet',
    'https://health.usnews.com/best-diet/flexitarian-diet',
    'https://health.usnews.com/best-diet/weight-watchers-diet',
    'https://health.usnews.com/best-diet/mayo-clinic-diet',
    'https://www.youtube.com/watch?v=KxKJEIqS1HQ',
    'https://www.youtube.com/watch?v=-b2lNLq3EaA',
    'https://www.youtube.com/watch?v=XalfukLpqEM',
    'https://www.youtube.com/watch?v=_emoxlq5Dh4',
    'https://www.muscleandfitness.com/workouts/',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Useful Resources'),
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
            color: Colors.blue,
            child: InkWell(
              onTap: (){
                launchURL(workoutURl[index]);
              },
              child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(achievementIcons[index]),
                SizedBox(
                  height: 15,
                ),
                Text(achievementName[index], textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 20
                ),),
              ],
            ),
          ),
          );
        },
      ),


    );
  }
}


launchURL(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    SnackBar(content: Text('No connection.'),);
    throw 'Could not launch $url';
  }
}