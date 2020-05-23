import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ohlonehackssubmission/widgets/custom_button.dart';
import 'package:ohlonehackssubmission/classes/http_requests.dart';

class Health extends StatefulWidget {
  @override
  _HealthState createState() => _HealthState();
}

class _HealthState extends State<Health> {

  getBloodOxygen(){
    

  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            CustomButton(
              text: 'Click to Check My Blood Oxygen Levels.',
              callback: (){
                DataFetcher();
              },
            ),

            SizedBox(
              height: 15,
            ),
            StreamBuilder(
              stream: getBloodOxygen(),
              builder: (context, snapshot) {
                if (!snapshot.hasData){
                  return CircularProgressIndicator();
                }
                return snapshot.data;
              },
            ),





          ],
        ),
      ),
    );
  }
}
