import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ohlonehackssubmission/pages/home.dart';
import 'package:ohlonehackssubmission/widgets/custom_button.dart';


class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String email;
  String password;



  signInUser() {
    Navigator.pop(context);
    Navigator.push(context,
        MaterialPageRoute(
            builder: (BuildContext context) => Home(index: 1)
        )
    );
  }

  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Hero(
              tag: 'Hero1',
              child:Container(
                decoration: BoxDecoration(
                    color: Colors.cyan,
                    borderRadius: BorderRadius.all(Radius.circular(25))
                ),
                child: Image(
                  image: AssetImage('assets/images/app_icon.png'),
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            TextField(
                onChanged: (value) => email = value,
                decoration: InputDecoration(
                    icon: Icon(Icons.person),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(3))
                    ),
                    hintText: 'Email',
                    fillColor: Colors.deepPurpleAccent
                )
            ),
            SizedBox(
              height: 15,
            ),
            TextField(
                onChanged: (value) => password = value,
                obscureText: true,
                autocorrect: false,
                decoration: InputDecoration(
                    icon: Icon(Icons.vpn_key),
                    hintText: 'Password',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(3))
                    )
                )
            ),
            SizedBox(
              height: 15,
            ),
            CustomButton(
              text: 'Login',
              callback: () {
                signInUser();
              } ,
            ),
            SizedBox(
              height: 15,
            ),

          ],
        ),
      ),
    );
  }
}
