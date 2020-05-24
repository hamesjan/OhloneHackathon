import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
                  return CircularProgressIndicator();
                }
                return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.redAccent,
                        borderRadius: BorderRadius.all(Radius.circular(25))
                      ),
                      height: MediaQuery.of(context).size.height / 6,
                      child: Column(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Icon(Icons.control_point, color: Colors.white,),
                              SizedBox(width: 15,),
                              Text('Pulse', style: TextStyle(
                                fontWeight:FontWeight.bold,
                                color: Colors.white,

                              ),)

                            ],
                          ),
                          Divider(thickness: 5,),
                          Text('${snapshot.data.pulse} BPM', style: TextStyle(
                            fontSize: 48,
                            color: Colors.white
                          ),)

                        ],

                      ),
                    )

                  ],

                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
