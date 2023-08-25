import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
//import 'package:simpleoracle/ads.dart';
import 'package:simpleoracle/main.dart';
//import 'dart:math';
import 'question_input_screen.dart';
import 'start_screen.dart';
//import 'data.dart'; // Import your lists of elements here
import 'package:simpleoracle/model/generateanswer.dart';

class AnswerScreen extends StatefulWidget {
  final String userInput;
  //const AnswerScreen({super.key});
  const AnswerScreen({required this.userInput, Key? key}) : super(key: key);

  @override
  //_AnswerScreenState createState() => _AnswerScreenState();
  State<AnswerScreen> createState() => _AnswerScreenState();
}

class _AnswerScreenState extends State<AnswerScreen> {
  String oracleAnswer = '';
  bool answerVisible = false;
  bool isLiked = false; // Flag to track liked status

  List<String> begs = [
    "DO",
    "DOES",
    "CAN",
    "COULD",
    "SHOULD",
    "SHALL",
    "MAY",
    "WILL",
    "AM",
    "ARE",
    "IS"
  ];

  Map<String, String> subj = {
    "I": "You",
    'YOU': "I",
    'HE': "He",
    'SHE': 'She',
    'IT': 'It',
    'WE': 'You',
    'THEY': 'They'
  };
  void generateOracleAnswer() {
    List<String> question = widget.userInput.toUpperCase().split(' ');
    setState(() {
      if (begs.contains(question[0]) && question[1] != 'IT') {
        oracleAnswer = generateDirectAnswer(subj[question[1]]!);
      } else {
        oracleAnswer = generateAnswer();
      }
    });
  }

  @override
  void initState() {
    super.initState();
    //AdManager.showInterstitialAd();
    Future.delayed(const Duration(seconds: 1), () {
      generateOracleAnswer();
      //print(generateAnswer());
      setState(() {
        answerVisible = true;
      });
    });
    //AdManager.showInterstitialAd(); // Show the interstitial ad
    //AdManager.loadBannerAd(); // Load the banner ad
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.black,
      //appBar: AppBar(
      //  backgroundColor: Colors.black,
      //  automaticallyImplyLeading: false,
      //),
      body: Stack(
        children: [
          // Background Image
          Image.asset(
            'lib/assets/pictures/Cloud1.jpg', // Replace with your image path
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: AnimatedOpacity(
                    opacity: answerVisible ? 1.0 : 0.0,
                    duration: const Duration(seconds: 2),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '\n\n\n$oracleAnswer',
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              fontSize: 24,
                              color: Colors.white,
                              fontFamily: 'Outfit'),
                        ),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const QuestionInputScreen()),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    const Color.fromARGB(129, 93, 39, 228),
                              ),
                              child: const Text('Ask Again',
                                  style: TextStyle(fontFamily: 'Outfit')),
                            ),
                            const SizedBox(
                                width: 20), // Add spacing between buttons
                            IconButton(
                              icon: Icon(
                                isLiked
                                    ? Icons.favorite
                                    : Icons.favorite_border,
                                color: isLiked
                                    ? const Color.fromARGB(255, 140, 21, 46)
                                    : const Color.fromARGB(171, 255, 255, 255),
                              ),
                              onPressed: () async {
                                setState(() {
                                  isLiked = !isLiked;
                                });
                                if (isLiked) {
                                  // Add the oracleAnswer to the list of liked answers
                                  likedAnswers.add(oracleAnswer);
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text('Answer Liked!')),
                                  );
                                  SharedPreferences prefs =
                                      await SharedPreferences.getInstance();
                                  await prefs.setStringList(
                                      'likedAnswers', likedAnswers);
                                }
                              },
                            ),
                          ],
                        ),
                        SizedBox(height: 0.19 * screenHeight),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 0.9 * screenHeight, // Replace y with the desired y-coordinate
            left: 0.9 * screenWidth, // Replace x with the desired x-coordinate
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const StartScreen()),
                );
              },
              style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: const Color.fromARGB(129, 0, 0, 0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  alignment: Alignment.center),
              child: const Text('Menu',
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Outfit',
                      fontWeight: FontWeight.bold)),
            ),
          ),
        ],
      ),
    );
  }
}
