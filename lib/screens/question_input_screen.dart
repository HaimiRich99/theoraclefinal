import 'package:flutter/material.dart';
//import 'package:simpleoracle/ads.dart';
import 'answer_screen.dart';
import 'start_screen.dart';

class QuestionInputScreen extends StatefulWidget {
  const QuestionInputScreen({super.key});

  @override
  //_QuestionInputScreenState createState() => _QuestionInputScreenState();
  State<QuestionInputScreen> createState() => _QuestionInputScreenState();
}

class _QuestionInputScreenState extends State<QuestionInputScreen> {
  final TextEditingController _questionController = TextEditingController();
  bool _canAsk = false;

  void _updateCanAsk() {
    setState(() {
      _canAsk = _questionController.text.isNotEmpty;
    });
  }

  @override
  void dispose() {
    _questionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          // Background Image
          Image.asset(
            'lib/assets/pictures/CloudQ.jpg',
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 0.99 * screenWidth,
                  child: TextField(
                    controller: _questionController,
                    onChanged: (text) => _updateCanAsk(),
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.white,
                      fontFamily: 'Outfit',
                    ),
                    maxLines: 5,
                    decoration: const InputDecoration(
                      labelText: 'Type your thoughts and questions.',
                      labelStyle: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Outfit',
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: Color.fromARGB(129, 93, 39, 228)),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _canAsk
                      ? () {
                          //String a = _questionController.text;
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) {
                              // AdManager.loadInterstitialAd();
                              //AdManager.showInterstitialAd(); // Load the interstitial ad
                              //Future.delayed(const Duration(seconds: 5));
                              return AnswerScreen(
                                  userInput: _questionController.text);
                            }),
                          );
                        }
                      : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(129, 93, 39, 228),
                  ),
                  child:
                      const Text('Ask', style: TextStyle(fontFamily: 'Outfit')),
                ),
              ],
            ),
          ),
          // Positioned Menu Button
          Positioned(
            top: 0.90 * screenHeight, // Replace y with the desired y-coordinate
            left: 0.85 * screenWidth, // Replace x with the desired x-coordinate
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
