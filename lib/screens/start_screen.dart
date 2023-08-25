import 'package:flutter/material.dart';
import 'package:simpleoracle/main.dart';
import 'package:simpleoracle/screens/info.dart';
import 'package:video_player/video_player.dart';
import 'question_input_screen.dart';
import 'likes.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({super.key});

  @override
  //_StartScreenState createState() => _StartScreenState();
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset('lib/assets/videos/Clouds.mp4')
      ..initialize().then((_) {
        _controller.play();
        _controller.setLooping(true);
        setState(() {}); // Trigger a rebuild to show the video
      });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          FittedBox(
            fit: BoxFit.cover,
            child: SizedBox(
              width: _controller.value.size.width,
              height: _controller.value.size.height,
              child: VideoPlayer(_controller),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 0.21 * MediaQuery.of(context).size.height),
                const Text(
                  'The Oracle',
                  style: TextStyle(
                      fontSize: 42,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Antiqua',

                      //backgroundColor: Color.fromARGB(101, 255, 255, 255),
                      color: Color.fromARGB(255, 172, 142, 255)),
                ),
                //const SizedBox(height: 20),
                SizedBox(height: 0.05 * MediaQuery.of(context).size.height),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const QuestionInputScreen()),
                    );
                  },
                  child: const Text(
                    'Ask your question',
                    style: TextStyle(
                      fontSize: 28,
                      color: Color.fromARGB(205, 255, 255,
                          255), //Color.fromARGB(255, 194, 179, 235),
                      fontFamily: 'Outfit',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 0.23 * MediaQuery.of(context).size.height),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              LikedAnswersScreen(likedAnswers)),
                    );
                  },
                  child: const Text(
                    'Liked Answers',
                    style: TextStyle(
                      fontSize: 24,
                      color: Color.fromARGB(205, 255, 255,
                          255), //Color.fromARGB(255, 194, 179, 235),
                      //decoration: TextDecoration.underline,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Outfit',
                    ),
                  ),
                ),
                SizedBox(height: 0.03 * MediaQuery.of(context).size.height),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const InfoScreen()),
                    );
                  },
                  child: const Text(
                    'Info',
                    style: TextStyle(
                      fontSize: 24,
                      color: Color.fromARGB(205, 255, 255,
                          255), //Color.fromARGB(255, 255, 255,255),
                      //Color.fromARGB(255, 93, 39, 228),
                      //decoration: TextDecoration.underline,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Outfit',
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
