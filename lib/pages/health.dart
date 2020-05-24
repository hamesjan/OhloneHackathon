import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ohlonehackssubmission/pages/diets_and_workouts.dart';
import 'package:ohlonehackssubmission/widgets/custom_button.dart';
import 'package:ohlonehackssubmission/classes/heartrate_http.dart';

class Health extends StatefulWidget {
  @override
  _HealthState createState() => _HealthState();
}

class _HealthState extends State<Health> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 15,
            ),

            StreamBuilder(
              stream: HeartRateFetch().stream,
              builder: (context, snapshot) {
                if (!snapshot.hasData){
                  return Row(  mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CircularProgressIndicator(backgroundColor: Colors.white,)
                    ],
                  );
                } else if (snapshot.hasError){
                  return Row(  mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CircularProgressIndicator(backgroundColor: Colors.white,)
                    ],
                  );
                }
                return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.blueGrey,
                        borderRadius: BorderRadius.all(Radius.circular(25))
                      ),
                      height: MediaQuery.of(context).size.height / 3.5,
                      child: Column(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Icon(Icons.favorite, color: Colors.redAccent,),
                              SizedBox(width: 15,),
                              Text('Health', style: TextStyle(
                                fontWeight:FontWeight.bold,
                                color: Colors.white,
                                fontSize: 25

                              ),)

                            ],
                          ),
                          Divider(thickness: 5,),
                          Container(
                            padding: EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: Colors.redAccent,
                              borderRadius: BorderRadius.all(Radius.circular(25))
                            ),
                            child: Text('Pulse: ${snapshot.data.pulse} BPM', style: TextStyle(
                                fontSize: 36,
                                color: Colors.white
                            ),),
                          ),
                          SizedBox(
                            height: 25,
                          ),
                          Container(
                            padding: EdgeInsets.all(16),
                            decoration: BoxDecoration(
                                color: Colors.redAccent,
                                borderRadius: BorderRadius.all(Radius.circular(25))
                            ),
                            child: Text('Blood Oxygen: ${snapshot.data.pulse} BPM', style: TextStyle(
                                fontSize: 28,
                                color: Colors.white
                            ),),
                          )

                        ],

                      ),
                    )

                  ],

                );
              },
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(25)),
                color: Colors.orangeAccent
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Icon(Icons.trending_down, color: Colors.white,),
                      SizedBox(width: 15,),
                      Text('Weight Loss Tips', style: TextStyle(
                          fontWeight:FontWeight.bold,
                          color: Colors.white,
                          fontSize: 25
                      ),)

                    ],
                  ),
                  Divider(thickness: 5,),
                  SizedBox(height: 15,),
                  Row(
                    children: <Widget>[
                      Icon(Icons.star,size: 50,color: Colors.white,),
                      Text('The Three Golden \nRules of LitFit',style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold
                      ),),
                    ],
                  ),
                  Divider(thickness: 5,),
                  SizedBox(height: 5,),
                  Text('1. Be Realistic.', style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                    color: Colors.white
                  ),),
                  Text(' You will never reach your unrealistic goals. It is better to overcome small goals than to set a huge goal. Small goals will keep you motivated and optimistic!'),
                  SizedBox(height: 5,),
                  Text('2. Be Forgiving.', style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                      color: Colors.white
                  ),),
                  SizedBox(height: 5,),
                  Text("Dont get down on yourself. LitFit is here to motivate you, not put you down. Have the occasional cheat day! Don't let LitFit keep you from being happy."),
                  Text('3. Stay Hydrated.', style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                      color: Colors.white
                  ),),
                  Text("There is nothing more important than staying hydrated. Drink that Water!"),
                  SizedBox(height: 15,),
                  CustomButton(
                    text: 'See Useful Diets and Workouts!',
                    callback: (){
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) => DietsWorkouts()
                        )
                      );
                    },
                  )

                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
