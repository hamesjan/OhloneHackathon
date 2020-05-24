import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'dart:async';
import 'dart:math';
import 'package:ohlonehackssubmission/classes/http_requests.dart';
import 'package:http/http.dart';

class StepPage extends StatefulWidget {
  @override
  _StepPageState createState() => _StepPageState();
}

class _StepPageState extends State<StepPage> {
  String _timeString;
  Timer _timer;
  String _quoteOfDay;
  String todayTime;
  var now = new DateTime.now();
  List quotes = ['“The Way Get Started Is To Quit Talking And Begin Doing.” – Walt Disney',
    '“The Pessimist Sees Difficulty In Every Opportunity. The Optimist Sees Opportunity In Every Difficulty.” – Winston Churchill',
    '“Don’t Let Yesterday Take Up Too Much Of Today.” – Will Rogers',
    '“You Learn More From Failure Than From Success. Don’t Let It Stop You. Failure Builds Character.” – Unknown',
    '“It’s Not Whether You Get Knocked Down, It’s Whether You Get Up.” – Inspirational Quote By Vince Lombardi',
    '“If You Are Working On Something That You Really Care About, You Don’t Have To Be Pushed. The Vision Pulls You.” – Steve Jobs',
    '“People Who Are Crazy Enough To Think They Can Change The World, Are The Ones Who Do.” – Rob Siltanen',
    '“Failure Will Never Overtake Me If My Determination To Succeed Is Strong Enough.” – Og Mandino',
    ' “Entrepreneurs Are Great At Dealing With Uncertainty And Also Very Good At Minimizing Risk. That’s The Classic Entrepreneur.” – Mohnish Pabrai',
    '“We May Encounter Many Defeats But We Must Not Be Defeated.” – Maya Angelou',
    '“Knowing Is Not Enough; We Must Apply. Wishing Is Not Enough; We Must Do.” – Johann Wolfgang Von Goethe',
    '“Imagine Your Life Is Perfect In Every Respect; What Would It Look Like?” – Brian Tracy',
    '“We Generate Fears While We Sit. We Overcome Them By Action.” – Dr. Henry Link',
    '“Whether You Think You Can Or Think You Can’t, You’re Right.” – Quote By Henry Ford',
    '“Security Is Mostly A Superstition. Life Is Either A Daring Adventure Or Nothing.” – Life Quote By Helen Keller',
    '“The Man Who Has Confidence In Himself Gains The Confidence Of Others.” – Hasidic Proverb',
    '“The Only Limit To Our Realization Of Tomorrow Will Be Our Doubts Of Today.” – Motivational Quote By Franklin D. Roosevelt',
    '“Creativity Is Intelligence Having Fun.” – Albert Einstein',
    '“What You Lack In Talent Can Be Made Up With Desire, Hustle And Giving 110% All The Time.” – Don Zimmer',
    '“Do What You Can With All You Have, Wherever You Are.” – Theodore Roosevelt',
    '“Develop An ‘Attitude Of Gratitude’. Say Thank You To Everyone You Meet For Everything They Do For You.” – Encouraging Quote By Brian Tracy',
    '“You Are Never Too Old To Set Another Goal Or To Dream A New Dream.” – C.S. Lewis',
    '“To See What Is Right And Not Do It Is A Lack Of Courage.” – Confucius',
    '“Reading Is To The Mind, As Exercise Is To The Body.” – Brian Tracy',
    '“Fake It Until You Make It! Act As If You Had All The Confidence You Require Until It Becomes Your Reality.” – Brian Tracy',
    '“The Future Belongs To The Competent. Get Good, Get Better, Be The Best!” – Success Quote By Brian Tracy',
    '“For Every Reason It’s Not Possible, There Are Hundreds Of People Who Have Faced The Same Circumstances And Succeeded.” – Jack Canfield',
    '“Things Work Out Best For Those Who Make The Best Of How Things Work Out.” – Positive Quote By John Wooden',
    '“A Room Without Books Is Like A Body Without A Soul.” – Marcus Tullius Cicero',
    '“I Think Goals Should Never Be Easy, They Should Force You To Work, Even If They Are Uncomfortable At The Time.” – Michael Phelps',
    '“One Of The Lessons That I Grew Up With Was To Always Stay True To Yourself And Never Let What Somebody Else Says Distract You From Your Goals.” – Michelle Obama',
    '“Today’s Accomplishments Were Yesterday’s Impossibilities.” – Robert H. Schuller',
    '"The Only Way To Do Great Work Is To Love What You Do. If You Haven’t Found It Yet, Keep Looking. Don’t Settle.” – Steve Jobs',
    '“You Don’t Have To Be Great To Start, But You Have To Start To Be Great.” – Zig Ziglar',
    '“A Clear Vision, Backed By Definite Plans, Gives You A Tremendous Feeling Of Confidence And Personal Power.” – Brian Tracy',
    '“There Are No Limits To What You Can Accomplish, Except The Limits You Place On Your Own Thinking.” – Brian Tracy',
    '“Integrity Is The Most Valuable And Respected Quality Of Leadership. Always Keep Your Word.” – Brian Tracy',
    '“Leadership Is The Ability To Get Extraordinary Achievement From Ordinary People” – Brian Tracy',
    '“Leaders Set High Standards. Refuse To Tolerate Mediocrity Or Poor Performance” – Brian Tracy',
    '“Clarity Is The Key To Effective Leadership. What Are Your Goals?” – Brian Tracy',
    '“The Best Leaders Have A High Consideration Factor. They Really Care About Their People” – Brian Tracy',
    '“Leaders Think And Talk About The Solutions. Followers Think And Talk About The Problems.” – Brian Tracy',
    '“The Key Responsibility Of Leadership Is To Think About The Future. No One Else Can Do It For You.” – Brian Tracy',
    '“The Effective Leader Recognizes That They Are More Dependent On Their People Than They Are On Them. Walk Softly.” – Brian Tracy',
    '“Leaders Never Use The Word Failure. They Look Upon Setbacks As Learning Experiences.” – Brian Tracy',
    '“Practice Golden Rule Management In Everything You Do. Manage Others The Way You Would Like To Be Managed.” – Brian Tracy',
    '“Leaders Are Anticipatory Thinkers. They Consider All Consequences Of Their Behaviors Before They Act.” – Brian Tracy',
    '“The True Test Of Leadership Is How Well You Function In A Crisis.” – Brian Tracy',
    '“Leaders Concentrate Single-Mindedly On One Thing– The Most Important Thing, And They Stay At It Until It’s Complete.” – Brian Tracy',
    '“The Three ‘C’s’ Of Leadership Are Consideration, Caring, And Courtesy. Be Polite To Everyone.” – Brian Tracy',
    '“Respect Is The Key Determinant Of High-Performance Leadership. How Much People Respect You Determines How Well They Perform.” – Brian Tracy',
    '“Leadership Is More Who You Are Than What You Do.” – Brian Tracy',
    '“Entrepreneurial Leadership Requires The Ability To Move Quickly When Opportunity Presents Itself.” – Brian Tracy',
    '“Leaders Are Innovative, Entrepreneurial, And Future-Oriented. They Focus On Getting The Job Done.” – Brian Tracy',
    '“Leaders Are Never Satisfied; They Continually Strive To Be Better.” – Brian Tracy',
    '“When the going gets tough, the tough get going.” – Joe Kennedy',
    '“Opportunities don’t happen, you create them.” – Chris Grosser',
    '“To accomplish great things, we must not only act, but also dream, not only plan, but also believe.” – Anatole France',
    '“Good things come to people who wait, but better things come to those who go out and get them.” – Anonymous',
    'We are what we repeatedly do. Excellence, then, is not an act, but a habit.” – Aristotle',
    'It is during our darkest moments that we must focus to see the light.” – Aristotle Onassis',
    '“Always make a total effort, even when the odds are against you.” – Arnold Palmer',
    '“Start where you are. Use what you have. Do what you can.” – Arthur Ashe',
  ];

  final earlyMorningTime = DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day, 5, 0);
  final morningTime = DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day, 11, 00);
  final afternoonTime = DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day, 18, 00);
  final nightTime = DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day, 24, 00);
  DateTime currentTime = DateTime.now();

  int randomNumb() {
    Random random = new Random();
    int randomNumber = random.nextInt(62);
    return randomNumber;
  }



  @override
  void initState() {
    super.initState();
    _quoteOfDay = quotes[randomNumb()];
    _timeString = _formatDateTime(DateTime.now());
    _timer = Timer.periodic(Duration(seconds: 1), (Timer t) => _getTime());
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  String _formatDateTime(DateTime dateTime) {
    return DateFormat('jms').format(dateTime);
  }
  void _getTime() {
    final DateTime now = DateTime.now();
    final String formattedDateTime = _formatDateTime(now);
    _timeString = formattedDateTime;
  }
  Image getImage() {
    if(currentTime.isBefore(earlyMorningTime)) {
      return Image(image: AssetImage('assets/images/night.jpg'));
    } else if (currentTime.isAfter(earlyMorningTime) && currentTime.isBefore(morningTime)) {
      return Image(image: AssetImage('assets/images/morning.jpg'));
    } else if (currentTime.isAfter(morningTime) && currentTime.isBefore(afternoonTime)) {
      return Image(image: AssetImage('assets/images/afternoon.jpg'));
    } else if (currentTime.isAfter(afternoonTime) && currentTime.isBefore(nightTime)) {
      return Image(image:AssetImage('assets/images/night.jpg'));
    } else return Image(image: AssetImage('assets/images/night.jpg'));
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.all(6),
        child:Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: getImage(),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(25))
                  ),

                ),
                Positioned(
                    left: 16,
                    bottom: 16,
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(25))
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(12),
                        child:Text(_timeString,
                          style: TextStyle(
                            fontSize: 35,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    )
                )
              ],
            ),
            SizedBox(
              height: 15,
            ),


            Column(
              children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.height / 4,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.all(Radius.circular(10) ),
                  ),
                  padding: EdgeInsets.all(5),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Excersice Activity',
                        style: TextStyle(
                            fontSize: 42,
                            color: Colors.white
                        ),
                      ),
                      Divider(thickness: 2,color: Colors.white,),
                      SizedBox(
                        height: 10,
                      ),
                      StreamBuilder(
                        stream: DataFetcher().stream,
                        builder: (context,snapshot) {
                          if(!snapshot.hasData){
                            return CircularProgressIndicator();
                          }
                          return Column(
                            children: <Widget>[
                              Text('Excersice Points: ${snapshot.data.totalsteps}',
                                  style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white
                              )),
                              SizedBox(height: 12,),
                              Text('Steps Today: ${snapshot.data.dailysteps}',
                                  style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white
                                  )
                              ),
                              SizedBox(height: 12,),
                              Text('Steps This Week: ${snapshot.data.weeklysteps}',
                                  style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white
                                  )
                              )
                            ],
                          );
                        },
                      ),
                    ],),
                ),
              ],
            ),
            SizedBox(
              height: 15,
            ),

            Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10) ),
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.blue,
                        Colors.white,
                      ]
                  )
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('Inspiration of the Day', style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                  ),),
                  Divider(thickness: 3,),
                  Text(_quoteOfDay.toString())
                  //Text(quoteOfDay)
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}
