import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:whats_my_bike_worth/screens/form_screen.dart';
import '../utils/constants.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'WhatsMyBike\'sWorth',
          style: GoogleFonts.courgette(letterSpacing: 1.9),
        ),
        centerTitle: true,
        backgroundColor: bgColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Center(
          child: Container(
            height: screenSize.height * .8,
            alignment: Alignment.center,
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Want To Know Your Bike\'s Resell Value?',
                      style: GoogleFonts.courgette(fontSize: 19),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(
                      "assets/images/b1.jpg",
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Find out what could be the potential value of your bike using Machine Learning algorithms,trained on thousands of data points.',
                      style: GoogleFonts.roboto(
                        fontSize: 17,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Fill out the simple form to know your bike\'s worth in rupees.',
                      style: GoogleFonts.roboto(
                        fontSize: 17,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 100,
                ),
                ButtonTheme(
                  minWidth: screenSize.width * .9,
                  buttonColor: const Color(0xff4973a8),
                  child: MaterialButton(
                    elevation: 10,
                    height: 45,
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) {
                            return const FormScreen();
                          },
                        ),
                      );
                    },
                    child: const Text(
                      'Get Started',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                    color: btnColor,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
