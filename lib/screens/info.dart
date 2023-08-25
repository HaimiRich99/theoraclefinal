import 'package:flutter/material.dart';
//import 'package:google_mobile_ads/google_mobile_ads.dart';
//import 'package:simpleoracle/main.dart';
//import 'package:simpleoracle/ads.dart'; // Import your AdManager class

class InfoScreen extends StatefulWidget {
  const InfoScreen({super.key});

  @override
  //_InfoScreenState createState() => _InfoScreenState();
  State<InfoScreen> createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Info Screen',
          style: TextStyle(fontFamily: 'Outfit'),
        ),
        backgroundColor: Colors.black,
      ),
      body: const Column(
        children: [
          // Display the BannerAd in a container
          //Container(
          //  alignment: Alignment.bottomCenter,
          //  child: AdWidget(ad: AdManager.bannerAd),
          //  width: AdManager.bannerAd.size.width.toDouble(),
          //  height: AdManager.bannerAd.size.height.toDouble(),
          //),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'App Information',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Outift',
                      color: Color.fromARGB(255, 93, 39, 228)),
                ),
                SizedBox(height: 10),
                Text(
                  'This is not an AI, delivering input-based, well-crafted reasonable advices for your everyday life.\nRather, a combinatory system is employed to produce an oracular response that the reader may relate to the circumstances fostering his questions.\nRandomness creates the space where meaning sprouts: raise a fateful question and every sign will point to its answer.',
                  style: TextStyle(fontSize: 18, fontFamily: 'Outfit'),
                ),
                SizedBox(height: 20),
                Text(
                  'Credits',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Outift',
                      color: Color.fromARGB(255, 140, 21, 46)),
                ),
                SizedBox(height: 10),
                Text(
                  'Background video:\nDeveloper: Haimi Rich...',
                  style: TextStyle(fontSize: 16, fontFamily: 'Outfit'),
                ),
                //bottomAppBar:
                // Rest of your InfoScreen content
              ],
            ),
          ),
        ],
      ),
      backgroundColor: Colors.black,
    );
  }
}
