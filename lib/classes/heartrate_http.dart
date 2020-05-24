import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

HeartRateData heartRateDataFromJson(String str) => HeartRateData.fromJson(json.decode(str));

String heartRateDataToJson(HeartRateData data) => json.encode(data.toJson());

class HeartRateData {
  String pulse;
  String bloodoxygen;

  HeartRateData({
    this.pulse,
    this.bloodoxygen
  });

  factory HeartRateData.fromJson(Map<String, dynamic> json) => HeartRateData(
    pulse: json["pulse"],
    bloodoxygen: json["blood oxygen"]
  );

  Map<String, dynamic> toJson() => {
    "pulse": pulse,
    "blood oxygen" : bloodoxygen
  };
}


class HeartRateFetch {

  // ignore: close_sinks
  final _heartController = StreamController<HeartRateData>();

  Stream<HeartRateData> get stream => _heartController.stream;


  HeartRateFetch(){
    Timer.periodic(Duration(seconds: 1), (t) async {
      // add the http status code = 200
      var response = await http.get('https://us-central1-aiot-fit-xlab.cloudfunctions.net/ufitgetheartrateandox');
      _heartController.add(
        HeartRateData.fromJson(jsonDecode(response.body))
      );

    });

  }
}

