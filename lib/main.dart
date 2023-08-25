import 'package:flutter/material.dart';
import 'screens/start_screen.dart';
//import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:shared_preferences/shared_preferences.dart'; // Add this import

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //await MobileAds.instance.initialize();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  likedAnswers = prefs.getStringList('likedAnswers') ?? [];
  runApp(const OracleApp());
}

class OracleApp extends StatelessWidget {
  const OracleApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'The Oracle',
      theme: ThemeData.dark(),
      home: const StartScreen(),
    );
  }
}

List<String> likedAnswers = [];
