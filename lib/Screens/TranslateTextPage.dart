import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:language_translation/utility/Langauge_box.dart';
import 'package:language_translation/utility/translate_from.dart';
import 'package:language_translation/utility/translate_to.dart';
import 'package:http/http.dart' as http;

class Translatetextpage extends StatefulWidget {
  final VoidCallback showHomePage;
  const Translatetextpage({super.key, required this.showHomePage});

  @override
  State<Translatetextpage> createState() => _TranslatetextpageState();
}

class _TranslatetextpageState extends State<Translatetextpage> {
  Map<String, String>? selectedcountryfrom;
  Map<String, String>? selectedcountryto;
  TextEditingController controller = TextEditingController();
  String _translatetext = '';

  void _handleLanguageChangefrom(Map<String, String>? newcountry) {
    setState(() {
      selectedcountryfrom = newcountry;
    });
  }

  void _handlecountryChangeto(Map<String, String>? newcountry) {
    setState(() {
      selectedcountryto = newcountry;
    });
  }

  Future<void> _translateText() async {
    if (selectedcountryfrom == null || selectedcountryto == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill all required fields')),
      );
      return;
    }
    final fromlanguage = selectedcountryfrom?["countrycode"];
    final tolanguage = selectedcountryto?["countrycode"];
    final text = Uri.encodeComponent(controller.text);
    final url = Uri.parse(
      'https://api.mymemory.translated.net/get?q=$text&langpair=$fromlanguage|$tolanguage',
    );
    // final url = Uri.parse('https://api.mymemory.translated.net/get?q=${Uri.encodeComponent(controller.text)}&langpair=$fromlanguage|$tolanguage');
    try {
      /* final response = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: json.encode({
          "q": controller.text,
          "source": fromlanguage,
          "target": tolanguage,
          "format": "text"
        }),
      ); */
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        setState(() {
          _translatetext = data['responseData']?['translatedText'] ?? '';
        });
      } else {
        print("Translation failed: ${response.body}");
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Failed to translate')),
        );
      }
    } catch (e) {
      print("Error: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Error occurred while translating')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Container(
                            height: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5.0),
                              color: Color(0xFFF7E7CE),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 5.0),
                                  child: LangaugeBox(
                                      onLanguageChanged:
                                          _handleLanguageChangefrom),
                                ),
                              
                                LangaugeBox(
                                    onLanguageChanged: _handlecountryChangeto),
                              ],
                            )),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      RichText(
                        text: TextSpan(
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w300,
                                fontSize: 15.0,
                                color: Color(0xFF2F4F4F)),
                            children: <TextSpan>[
                              TextSpan(
                                  text: "Translate From:",
                                  style: GoogleFonts.poppins(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xFF2F4F4F))),
                              if (selectedcountryfrom?["countryLanguage"] !=
                                  null)
                                TextSpan(
                                    text:
                                        selectedcountryfrom?["countryLanguage"],
                                    style: GoogleFonts.poppins(
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xFF2F4F4F))),
                            ]),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 200,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Color(0xFF2F4F4F),
                        border:
                            Border.all(color: Color(0xFF000000), width: 0.2)),
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: TranslateFrom(controller: controller),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      RichText(
                        text: TextSpan(
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w300,
                                fontSize: 15.0,
                                color: Color(0x00000000)),
                            children: <TextSpan>[
                              TextSpan(
                                  text: "Translate To:",
                                  style: GoogleFonts.poppins(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xFF2F4F4F))),
                              if (selectedcountryto?["countryLanguage"] != null)
                                TextSpan(
                                    text: selectedcountryto?["countryLanguage"],
                                    style: GoogleFonts.poppins(
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xFF2F4F4F))),
                            ]),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 200,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Color(0xFF2F4F4F),
                        border:
                            Border.all(color: Color(0xFF000000), width: 0.2)),
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: TranslateTo(trasnlsatetext: _translatetext),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFFF7E7CE),
                      padding: EdgeInsets.zero, // To avoid extra padding
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: () {
                      _translateText();
                    },
                    child: Container(
                      height: 50,
                      alignment: Alignment.center,
                      child: Text(
                        'Submit',
                        style: GoogleFonts.poppins(
                          fontSize: 20.0,
                          color: Color(0xFF2F4F4F),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
