import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ResultScreen extends StatelessWidget {
  Map<String, dynamic> result = {};

  ResultScreen(
    Map<String, dynamic> result, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(result);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Your Result',
          style: GoogleFonts.courgette(),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xff4e405f),
      ),
      body: Container(),
    );
  }
}
