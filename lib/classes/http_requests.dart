import 'dart:convert';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

StepData stepDataFromJson(String str) => StepData.fromJson(json.decode(str));

String stepDataToJson(StepData data) => json.encode(data.toJson());

class StepData {
  int totalSteps;
  int stepsToday;
  int stepsThisWeek;

  StepData({
    this.totalSteps,
    this.stepsToday,
    this.stepsThisWeek,
  });

  factory StepData.fromJson(Map<String, dynamic> json) => StepData(
    totalSteps: json["totalSteps"],
    stepsToday: json["stepsToday"],
    stepsThisWeek: json["stepsThisWeek"],
  );

  Map<String, dynamic> toJson() => {
    "totalSteps": totalSteps,
    "stepsToday": stepsToday,
    "stepsThisWeek": stepsThisWeek,
  };
}



class DataFetcher {
  Map<String, dynamic> sample = { 'totalSteps': 4, 'stepsToday': 4, "stepsThisWeek": 5};

  StepData _stepdata;
  
  // ignore: close_sinks
  final _controller = StreamController<StepData>();

  Stream<StepData> get stream => _controller.stream;

  DataFetcher(){

    Timer.periodic(Duration(seconds: 1), (t) async {
      // add the http status code = 200
      var response = await http.get('https://us-central1-teamzero.cloudfunctions.net/function-1');
      // print(response.body);


      _controller.add(
      //  StepData.fromJson(jsonDecode(response.body))

          StepData.fromJson(sample)
      );
    });

  }
}