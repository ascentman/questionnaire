import 'package:flutter/material.dart';
import 'package:page_view_indicators/circle_page_indicator.dart';
import 'package:questionnaire/constants.dart';
import 'package:questionnaire/components/startButton.dart';
import 'package:questionnaire/components/question_page.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';

class HomePage extends StatefulWidget {
  static const id = 'questions_screen';
  RemoteConfig remoteConfig;

  HomePage({this.remoteConfig});

  @override
  HomePageState createState() {
    return new HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  final _items = [
    Colors.blue,
    Colors.orange,
    Colors.green,
    Colors.pink,
    Colors.red,
    Colors.amber,
  ];
  final _pageController = PageController();
  final _currentPageNotifier = ValueNotifier<int>(0);

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
                    if (_pageController.page < _items.length - 1) {
                      _pageController.nextPage(
                          duration: Duration(milliseconds: 400),
                          curve: Curves.easeInCubic);
                    } else {
                      print('send!!!');
                    }
                  });
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
          itemCount: _items.length,
          controller: _pageController,
          itemBuilder: (BuildContext context, int index) {
            return QuestionPage(
                index: index, remoteConfig: widget.remoteConfig);
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
        itemCount: _items.length,
        currentPageNotifier: _currentPageNotifier,
      ),
    );
  }
}
