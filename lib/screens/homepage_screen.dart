import 'package:flutter/material.dart';
import 'package:page_view_indicators/circle_page_indicator.dart';
import 'package:questionnaire/constants.dart';
import 'package:questionnaire/components/answer_widget.dart';
import 'package:questionnaire/components/startButton.dart';

class HomePage extends StatefulWidget {
  static const id = 'questions_screen';
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
    return Stack(
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
                print('wfef');
              },
            ),
            SizedBox(
              height: 20,
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
    );
  }

  _buildPageView() {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: PageView.builder(
          itemCount: _items.length,
          controller: _pageController,
          itemBuilder: (BuildContext context, int index) {
            return Column(
              children: <Widget>[
                Flexible(
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage(
                            'assets/question_${index + 1}_header.png'),
                      ),
                    ),
                  ),
                ),
                Flexible(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Flexible(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 24.0, horizontal: 10.0),
                          child: Container(
                            child: Container(
                              width: MediaQuery.of(context).size.width - 20,
                              child: Text(
                                'Question1 ddj dwjdk jwldw  dslsdlsdl dwldklwdklwd',
                                maxLines: 3,
                                textAlign: TextAlign.left,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontSize: 20.0,
                                    color: Colors.black87,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Flexible(
                        flex: 3,
                        child: ListView(
                          padding: EdgeInsets.all(0),
                          children: <Widget>[
                            AnswerWidget(
                              label: 'Answer 1 goes here',
                              isChecked: true,
                              onPress: () {
                                print('1 pressed');
                              },
                            ),
                            AnswerWidget(
                              label: 'Answer 2 goes here',
                              isChecked: false,
                              onPress: () {
                                print('2 pressed');
                              },
                            ),
                            AnswerWidget(
                              label: 'Answer 3 goes here',
                              isChecked: false,
                              onPress: () {
                                print('3 pressed');
                              },
                            ),
                            AnswerWidget(
                              label: 'Answer 4 goes here',
                              isChecked: false,
                              onPress: () {
                                print('3 pressed');
                              },
                            ),
                            AnswerWidget(
                              label:
                                  'Answer 5 goes here Answer 4 goes here d w w kwk w wddssdsdsdssd',
                              isChecked: false,
                              onPress: () {
                                print('4 pressed');
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
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
