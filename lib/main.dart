import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'src/view/auth/signUp.dart';
import 'src/view/widgets/home.dart';
import 'src/view/widgets/splash.dart';
import 'generated/l10n.dart';
import 'package:connectivity/connectivity.dart';
import 'package:permission/permission.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String token = null;
  static Permission _permission = Permission();
  Connectivity _conn;
  Future<void> getToken() async {
    try {
      SharedPreferences obj = await SharedPreferences.getInstance();
      setState(() {
        token = obj.getString("token");
      });
    } catch (e) {
      print("Hello World");
    }
  }

  Future<void> checkConnect() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      print("Check Permission ${connectivityResult}");
    } else {}
  }

  @override
  void initState() {
    super.initState();
    getToken();
    checkConnect();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'oun',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      locale: Locale.fromSubtags(languageCode: 'en'),
      localizationsDelegates: [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        Locale.fromSubtags(languageCode: 'en'),
        Locale.fromSubtags(languageCode: 'ar'),
      ],
      home: Splash(page: token == null ? SignUp() : Home()),
    );
  }
}
