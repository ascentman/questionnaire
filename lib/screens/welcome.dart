import 'package:flutter/material.dart';
import 'package:questionnaire/components/startButton.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:questionnaire/constants.dart';
import 'package:questionnaire/screens/homepage_screen.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';

class Welcome extends StatefulWidget {
  Welcome({this.remoteConfig});
  final RemoteConfig remoteConfig;

  void fetchFromRemoteConfig() async {
    try {
      // Using default duration to force fetching from remote server.
      await remoteConfig.fetch(expiration: const Duration(seconds: 0));
      await remoteConfig.activateFetched();
      for (String key in remoteConfig.getAll().keys) {
        Constants.defaultConfig[key] = remoteConfig.getValue(key).asString();
      }
    } on FetchThrottledException catch (exception) {
      // Fetch throttled.
      print(exception);
    } catch (exception) {
      print('Unable to fetch remote config');
    }
  }

  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  void initState() {
    super.initState();
    widget.fetchFromRemoteConfig();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ColorizeAnimatedTextKit(
                text: [
                  "QUESTIONNAIRE",
                ],
                textStyle: TextStyle(fontSize: 32.0, fontFamily: "Bitter"),
                colors: [
                  Constants.mainAppColor,
                  Colors.white70,
                  Colors.orange,
                ],
                textAlign: TextAlign.start,
                alignment: AlignmentDirectional.topStart // or Alignment.topLeft
                ),
            SizedBox(
              height: 100,
            ),
            StartButton(
              label: 'Start',
              margin: 40.0,
              padding: 8.0,
              borderRadius: 40.0,
              fontFamily: 'Bitter',
              fontSize: 24.0,
              onPress: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomePage(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
