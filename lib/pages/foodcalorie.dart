import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:ohlonehackssubmission/widgets/custom_button.dart';
import 'package:ohlonehackssubmission/classes/CalorieData.dart';
import 'package:mime/mime.dart';


class FoodCalorie extends StatefulWidget {
  @override
  FoodCalorieState createState() => FoodCalorieState();
}

class FoodCalorieState extends State<FoodCalorie> {
  Future<File> file;
  String status = '';
  String base64Image;
  File tmpFile;
  String errMessage = 'Error Uploading Image';


  Future<http.StreamedResponse> uploadImage(filename, url) async {
      var request = http.MultipartRequest('POST', Uri.parse(url));
      request.files.add(await http.MultipartFile.fromPath('file', filename));
      var res = await request.send();
      return res;
    }


  String respStr = '';
  CalorieData CalData = CalorieData(calories: 'Select an Image to get Started', names: ['']);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            CustomButton(
              text: 'Select an Image of Your Meal.',
              callback: () async {
                var file = await ImagePicker.pickImage(source: ImageSource.gallery);
                var res = await uploadImage(file.path, "http://37625b93.ngrok.io/caloriecount");
                respStr = await res.stream.bytesToString();
                setState(() {
                  CalData = CalorieData.fromJson(jsonDecode(respStr));
                });
              }
            ),
            SizedBox(
              height: 20.0,
            ),
//            FutureBuilder(
//              initialData: CalorieData(calories: 'Waiting ',names: ['Waiting']),
//              future: fetchUserOrder(),
//              builder: (BuildContext context, AsyncSnapshot snapshot){
//                List _lst = snapshot.data.names.map((title)=> Text(title,)).toList();

                 Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                            color: Colors.greenAccent,
                            borderRadius: BorderRadius.all(Radius.circular(25))
                        ),
                        child: Column(
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Icon(Icons.fastfood, color: Colors.black,),
                                SizedBox(width: 15,),
                                Text('Calorie Calculator', style: TextStyle(
                                    fontWeight:FontWeight.bold,
                                    color: Colors.black,
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
                              child: Text('Calculated Calories: ${CalData.calories}', style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.black
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
                              child: 

                              Text('Foods: ${CalData.names.toString().substring(1, CalData.names.toString().length - 1)}', style: TextStyle(
                                  fontSize: 28,
                                  //color: Colors.black
                            ),
                         ),
                            )

                          ],

                        ),
                      )

                    ],

                  )
//                }
//                ),
             ],
            ),
          )
    );
  }
}
