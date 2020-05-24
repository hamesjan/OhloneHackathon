import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:ohlonehackssubmission/pages/login.dart';
import 'package:ohlonehackssubmission/pages/step.dart';
import 'package:ohlonehackssubmission/pages/health.dart';
import 'package:ohlonehackssubmission/pages/foodcalorie.dart';
import 'package:ohlonehackssubmission/pages/achievements.dart';

class Home extends StatefulWidget {
  final int index;

  const Home({ Key key, this.index}): super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin{
  TabController _tabController;

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 3, initialIndex: widget.index);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Hero(
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(16)),
                color: Colors.cyan
            ),
            child :

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(Icons.directions_run),
                Text('LitFit', style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold
                ),)
              ],
            ),
          ),
          tag: 'Hero1',

        ),
        leading: Container(),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: (){
              Navigator.pop(context);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => Login()
                  )
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.lock),
            onPressed: (){
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => Achievements()
                )
              );
            },
          )
        ],
      ),
      body: SafeArea(
        child: TabBarView(
          controller: _tabController,
          children: <Widget>[
            Health(),
            StepPage(),
            FoodCalorie(),
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: TabBar(
          controller: _tabController,
          labelColor: Colors.black12,
          unselectedLabelColor: Colors.black38,
          tabs: <Widget>[
            Tab(
              icon: Icon(Icons.local_hospital),
              child: Text(
                'Health'
              ),
            ),
            Tab(
              icon: Icon(Icons.directions_run),
              child: Text(
                'Activity'
              ),
            ),
            Tab(
              icon: Icon(Icons.fastfood),
              child: Text(
                'Food'
              ),
            ),
          ],
        ),
      ),
    );
  }
}
