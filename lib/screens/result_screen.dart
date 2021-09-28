import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utils/constants.dart';

// ignore: must_be_immutable
class ResultScreen extends StatelessWidget {
  Map<String, dynamic> result = {};

  ResultScreen(
    this.result, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          'Your Result',
          style: GoogleFonts.courgette(),
        ),
        centerTitle: true,
        backgroundColor: bgColor,
      ),
      body: Container(
        color: bgColor,
        child: Column(
          children: [
            Center(
              child: Image.asset(
                "assets/images/b2.gif",
              ),
            ),
            Container(
              color: bgColor,
              child: Align(
                alignment: Alignment.center,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        'Your Bike\'s Resell Value',
                        style: GoogleFonts.courgette(
                          fontSize: 22,
                          color: Colors.white70,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        '${result["predicted_price"]} /-',
                        style: GoogleFonts.courgette(
                          fontSize: 32,
                          fontStyle: FontStyle.italic,
                          color: Colors.white70,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        "${result['in_words']}",
                        style: GoogleFonts.courgette(
                          fontSize: 19,
                          fontStyle: FontStyle.italic,
                          color: Colors.white70,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
