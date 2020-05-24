import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

HeartRateData heartRateDataFromJson(String str) => HeartRateData.fromJson(json.decode(str));

String heartRateDataToJson(HeartRateData data) => json.encode(data.toJson());

class HeartRateData {
  String pulse;

  HeartRateData({
    this.pulse,
  });

  factory HeartRateData.fromJson(Map<String, dynamic> json) => HeartRateData(
    pulse: json["pulse"],
  );

  Map<String, dynamic> toJson() => {
    "pulse": pulse,
  };
}


class HeartRateFetch {

  // ignore: close_sinks
  final _heartController = StreamController<HeartRateData>();

  Stream<HeartRateData> get stream => _heartController.stream;


  HeartRateFetch(){
    Timer.periodic(Duration(seconds: 1), (t) async {
      // add the http status code = 200
      var response = await http.get('https://us-central1-aiot-fit-xlab.cloudfunctions.net/ufitgetheartrates');
      _heartController.add(
        HeartRateData.fromJson(jsonDecode(response.body))
      );

    });

  }
}

