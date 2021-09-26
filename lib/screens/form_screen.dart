import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({Key? key}) : super(key: key);

  @override
  _FormScreenState createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Fill Details',
        ),
        centerTitle: true,
        backgroundColor: const Color(0xff4e405f),
      ),
      body: Container(
        child: const Text('Form Here...'),
      ),
    );
  }
}
