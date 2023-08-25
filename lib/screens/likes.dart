import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
//import 'package:google_mobile_ads/google_mobile_ads.dart';
//import 'package:simpleoracle/ads.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:simpleoracle/main.dart';

class LikedAnswersScreen extends StatefulWidget {
  final List<String> likedAnswers;

  const LikedAnswersScreen(this.likedAnswers, {Key? key});

  @override
  //_LikedAnswersScreenState createState() => _LikedAnswersScreenState();
  State<LikedAnswersScreen> createState() => _LikedAnswersScreenState();
}

class _LikedAnswersScreenState extends State<LikedAnswersScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Liked Answers',
          style: TextStyle(fontFamily: 'Outfit'),
          textAlign: TextAlign.center,
        ),
        backgroundColor: Colors.black,
      ),
      body: ListView.builder(
        itemCount: widget.likedAnswers.length,
        itemBuilder: (context, index) {
          return ListTile(
              contentPadding: const EdgeInsets.symmetric(horizontal: 39.0),
              title: Text(
                '\n${widget.likedAnswers[index]}',
                style: const TextStyle(fontFamily: 'Outfit'),
                textAlign: TextAlign.center,
              ),
              trailing: Wrap(children: [
                IconButton(
                  padding: const EdgeInsets.symmetric(vertical: 40.0),
                  icon: const Icon(Icons.delete, size: 20),
                  onPressed: () async {
                    setState(() {
                      widget.likedAnswers.removeAt(index);
                    });

                    SharedPreferences prefs =
                        await SharedPreferences.getInstance();
                    await prefs.setStringList(
                        'likedAnswers', widget.likedAnswers);

                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Answer Removed!')),
                    );
                  },
                ),
                IconButton(
                  padding: const EdgeInsets.symmetric(vertical: 40.0),
                  icon: const Icon(Icons.copy, size: 20),
                  onPressed: () {
                    Clipboard.setData(ClipboardData(text: likedAnswers[index]));
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Copied to clipboard!')));
                  },
                )
              ]));
        },
      ),
      backgroundColor: Colors.black,
    );
  }
}
