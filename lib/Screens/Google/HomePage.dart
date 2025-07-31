import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:language_translation/Screens/Google/Country_Retangle.dart';

class Homepage extends StatefulWidget {
  final VoidCallback showPormptPage;
  const Homepage({super.key, required this.showPormptPage});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: Container(
                decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Color(0xFFC9D6FF), Color(0xFFE2E2E2)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight)),
                child: Padding(
          padding: EdgeInsets.only(top: 80, left: 16, right: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Text(
                  "Select A Language",
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
              Expanded(child: Center(child: CountryRetangle())),
              Padding(
                padding: EdgeInsetsDirectional.all(15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RichText(
                      text: TextSpan(
                          style: GoogleFonts.poppins(height: 1.5),
                          children: <InlineSpan>[
                            const TextSpan(
                                text: 'Translate',
                                style: TextStyle(
                                  fontSize: 32.0,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF000000),
                                )),
                            TextSpan(
                                text: ' Every\n',
                                style: TextStyle(
                                    fontSize: 32.0,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF6D1B7B).withAlpha(50))),
                            const TextSpan(
                                text: 'Type World\n',
                                style: TextStyle(
                                  fontSize: 32.0,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF000000),
                                )),
                            const WidgetSpan(
                                child: SizedBox(
                              height: 35,
                            )),
                            const TextSpan(
                                text: 'Help you communicate in \n',
                                style: TextStyle(
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF000000),
                                )),
                            const TextSpan(
                                text: 'Different Language',
                                style: TextStyle(
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF000000),
                                )),
                          ]),
                      textAlign: TextAlign.center,
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 20),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.zero, // To avoid extra padding
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onPressed: (widget.showPormptPage),
                        child: Ink(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [Color(0xFF4A00E0), Color(0xFF8E2DE2)],
                              begin: Alignment
                                  .topLeft, // Change direction for style
                              end: Alignment.bottomRight,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Container(
                            height: 50,
                            alignment: Alignment.center,
                            child: Text(
                              'Start Translating',
                              style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
                ),
              ),
        ));
  }
}
