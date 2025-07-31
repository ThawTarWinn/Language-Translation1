import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:language_translation/Screens/Country_Box.dart';

class Homepagedesign extends StatefulWidget {
  final VoidCallback showPormptPage;
  const Homepagedesign({super.key, required this.showPormptPage});

  @override
  State<Homepagedesign> createState() => _HomepagedesignState();
}

class _HomepagedesignState extends State<Homepagedesign> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Container(
          color: Color(0xFFF8F7F5),
          child: Padding(
            padding: EdgeInsets.only(top: 80, left: 16, right: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Text(
                    "What would you like to \n translate today",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Container(
                      decoration: BoxDecoration(
                          color: Color(0xFF2F4F4F),
                          borderRadius: BorderRadius.circular(15.0),
                          border: Border.all(
                              width: 0.2, color: Colors.black.withAlpha(70))),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(25.0),
                            child: CountryBox(),
                          )
                        ],
                      )),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(15),
                        child: ElevatedButton(
                            onPressed: (widget.showPormptPage),
                            style: ElevatedButton.styleFrom(
                                padding: EdgeInsets.all(10),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15)),
                                backgroundColor: Color( 0xFFF7E7CE)),
                            child: Text(
                              "Click to Start",
                              style: GoogleFonts.poppins(
                                fontSize: 20.0,
                                fontWeight: FontWeight.w500,
                                color: Color(0xFF2F4F4F),
                              ),
                            )),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
