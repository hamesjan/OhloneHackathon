import 'dart:convert';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

StepData stepDataFromJson(String str) => StepData.fromJson(json.decode(str));

String stepDataToJson(StepData data) => json.encode(data.toJson());

class StepData {
  String totalsteps;
  String dailysteps;
  String weeklysteps;

  StepData({
    this.totalsteps,
    this.dailysteps,
    this.weeklysteps,
  });

  factory StepData.fromJson(Map<String, dynamic> json) => StepData(
    totalsteps: json["totalsteps"],
    dailysteps: json["dailysteps"],
    weeklysteps: json["weeklysteps"],
  );

  Map<String, dynamic> toJson() => {
    "totalsteps": totalsteps,
    "dailysteps": dailysteps,
    "weeklysteps": weeklysteps,
  };
}



class DataFetcher {
   Map<String, dynamic> sample = { 'totalSteps': 4, 'stepsToday': 4, "stepsThisWeek": 5};


  // ignore: close_sinks
  final _controller = StreamController<StepData>();

  Stream<StepData> get stream => _controller.stream;

  DataFetcher(){

    Timer.periodic(Duration(seconds: 1), (t) async {
      // add the http status code = 200
      var response = await http.post('https://us-central1-aiot-fit-xlab.cloudfunctions.net/ufitgetsteps');
       // print(response.body);

      _controller.add(
       StepData.fromJson(jsonDecode(response.body))

         // StepData.fromJson(sample)
      );
    });

  }
}