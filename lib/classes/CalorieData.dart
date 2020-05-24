import 'dart:convert';

CalorieData calorieDataFromJson(String str) => CalorieData.fromJson(json.decode(str));

String calorieDataToJson(CalorieData data) => json.encode(data.toJson());

class CalorieData {
  String calories;
  List<String> names;

  CalorieData({
    this.calories,
    this.names,
  });

  factory CalorieData.fromJson(Map<String, dynamic> json) => CalorieData(
    calories: json["calories"],
    names: List<String>.from(json["names"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "calories": calories,
    "names": List<dynamic>.from(names.map((x) => x)),
  };
}
