import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'constants.dart';
import 'screens/welcome.dart';

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
      color: Colors.white,
      home: FutureBuilder<RemoteConfig>(
        future: setupRemoteConfig(),
        builder: (BuildContext context, AsyncSnapshot<RemoteConfig> snapshot) {
          return snapshot.hasData
              ? Welcome(remoteConfig: snapshot.data)
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
