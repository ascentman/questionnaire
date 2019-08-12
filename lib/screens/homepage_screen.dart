import 'package:flutter/material.dart';
import 'package:page_view_indicators/circle_page_indicator.dart';
import 'package:questionnaire/constants.dart';
import 'package:questionnaire/components/startButton.dart';
import 'package:questionnaire/components/question_page.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class HomePage extends StatefulWidget {
  static const id = 'questions_screen';

  static FirebaseAnalytics analytics = FirebaseAnalytics();
  static FirebaseAnalyticsObserver observer =
      FirebaseAnalyticsObserver(analytics: analytics);

  @override
  HomePageState createState() {
    return new HomePageState(analytics, observer);
  }
}

class HomePageState extends State<HomePage> {
  final FirebaseAnalyticsObserver observer;
  final FirebaseAnalytics analytics;
  final _items = 6;
  final _pageController = PageController();
  final _currentPageNotifier = ValueNotifier<int>(0);

  HomePageState(this.analytics, this.observer);

  Future<void> _testSetUserProperty(String name, String value) async {
    await analytics.setUserProperty(name: name, value: value);
  }

  Future<void> _sendPressed() async {
    analytics.logEvent(name: 'send_pressed');
  }

  Future<void> _sendAlert(BuildContext _context) async {
    return Alert(
      context: _context,
      type: AlertType.success,
      title: "Success",
      desc: "Answers are sent to Firebase Analytics",
      buttons: [
        DialogButton(
          color: Constants.mainAppColor,
          child: Text(
            "OK",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () {
            Navigator.of(_context).pop();
          },
          width: 120,
        )
      ],
    ).show();
  }

  @override
  void initState() {
    super.initState();
    analytics.logEvent(name: 'questionnaire_started');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
    );
  }

  _buildBody() {
    return SafeArea(
      top: false,
      bottom: true,
      child: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              Flexible(
                flex: 6,
                fit: FlexFit.tight,
                child: Stack(
                  children: <Widget>[
                    _buildPageView(),
                  ],
                ),
              ),
              Column(
                children: <Widget>[
                  _buildCircleIndicator(),
                ]
                    .map(
                      (item) => Padding(
                        child: item,
                        padding: EdgeInsets.all(10.0),
                      ),
                    )
                    .toList(),
              ),
              StartButton(
                label: 'WEITER',
                margin: 16.0,
                padding: 16.0,
                borderRadius: 44.0,
                fontSize: 16.0,
                onPress: () {
                  setState(() {
                    if (_pageController.page < _items - 1) {
                      _pageController.nextPage(
                          duration: Duration(milliseconds: 400),
                          curve: Curves.easeInCubic);
                    } else {
                      for (String property in Constants.answers) {
                        _testSetUserProperty(property, 'answer was chosen');
                      }
                    }
                  });
                  if (_pageController.page == _items - 1) {
                    _sendPressed();
                    _sendAlert(context);
                  }
                },
              ),
            ],
          ),
          Align(
            alignment: Alignment(-1.15, -0.92),
            child: FlatButton(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                child: Icon(
                  Icons.arrow_back_ios,
                  size: 12,
                  color: Colors.black87,
                ),
                onPressed: () {
                  Navigator.pop(context);
                }),
          ),
        ],
      ),
    );
  }

  _buildPageView() {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: PageView.builder(
          itemCount: _items,
          controller: _pageController,
          itemBuilder: (BuildContext context, int index) {
            return QuestionPage(index: index);
          },
          onPageChanged: (int index) {
            _currentPageNotifier.value = index;
          }),
    );
  }

  _buildCircleIndicator() {
    return Container(
      child: CirclePageIndicator(
        size: 12.0,
        selectedSize: 12.0,
        dotColor: Constants.inactivePageIndicatorColor,
        selectedDotColor: Constants.mainAppColor,
        itemCount: _items,
        currentPageNotifier: _currentPageNotifier,
      ),
    );
  }
}
