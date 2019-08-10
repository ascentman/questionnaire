import 'package:flutter/material.dart';
import 'screens/homepage_screen.dart';
import 'package:flutter/services.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'dart:async';
import 'package:questionnaire/components/startButton.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:questionnaire/constants.dart';
import 'package:questionnaire/screens/homepage_screen.dart';

void main() => runApp(Questionnaire());

class Questionnaire extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.black, // status bar color
    ));
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      home: FutureBuilder<RemoteConfig>(
        future: setupRemoteConfig(),
        builder: (BuildContext context, AsyncSnapshot<RemoteConfig> snapshot) {
          return snapshot.hasData
              ? WelcomeWidget(remoteConfig: snapshot.data)
              : Container();
        },
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

Future<RemoteConfig> setupRemoteConfig() async {
  final RemoteConfig remoteConfig = await RemoteConfig.instance;
  // Enable developer mode to relax fetch throttling
  remoteConfig.setConfigSettings(RemoteConfigSettings(debugMode: true));
  remoteConfig.setDefaults(Constants.defaultConfig);
  return remoteConfig;
}

class WelcomeWidget extends AnimatedWidget {
  WelcomeWidget({this.remoteConfig}) : super(listenable: remoteConfig);

  final RemoteConfig remoteConfig;

  void fetchFromRemoteConfig() async {
    try {
      // Using default duration to force fetching from remote server.
      await remoteConfig.fetch(expiration: const Duration(seconds: 0));
      await remoteConfig.activateFetched();
      print('!!!!!!!!!YAY!!!!!');

      for (String key in remoteConfig.getAll().keys) {
        Constants.defaultConfig[key] = remoteConfig.getValue(key).asString();
      }

      print(Constants.defaultConfig.values);
    } on FetchThrottledException catch (exception) {
      // Fetch throttled.
      print(exception);
    } catch (exception) {
      print('Unable to fetch remote config');
    }
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
                fetchFromRemoteConfig();
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
