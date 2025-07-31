
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:language_translation/utility/Google/language_dropdown.dart';
import 'package:language_translation/utility/translate_from.dart';
import 'package:language_translation/utility/translate_to.dart';

class Promptpage extends StatefulWidget {
  final VoidCallback showHomePage;
  const Promptpage({super.key, required this.showHomePage});

  @override
  State<Promptpage> createState() => _PromptpageState();
}

class _PromptpageState extends State<Promptpage> {
  String? selectedcountryfrom;
  String? selectedcountryto;
  TextEditingController controller = TextEditingController();
  String _translatetext = '';

  void _handleLanguageChangefrom(String? newcountry) {
    setState(() {
      selectedcountryfrom = newcountry;
    });
  }

  void _handlecountryChangeto(String? newcountry) {
    setState(() {
      selectedcountryto = newcountry;
    });
  }

  Future<void> _translateText() async {
    final apiKey = dotenv.env['API_KEY'];
    if (apiKey == null) {
      print('No API_KEY environment variable');
      return;
    }

    final inputText = controller.text;
    final fromLang = selectedcountryfrom;
    final toLang = selectedcountryto;

    // Validation checks
    if (inputText.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('What are you translating?')),
      );
      return;
    }

    if (fromLang == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text('What language are you translating from?')),
      );
      return;
    }

    if (toLang == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('What language are you translating to?')),
      );
      return;
    }

    setState(() {
      //  _loading = true;
    });

    try {
      final model = GenerativeModel(model: 'gemini-1.5-flash', apiKey: apiKey);
      final content = [
        Content.text('Translate only "$inputText" from $fromLang to $toLang')
      ];
      final response = await model.generateContent(content);

      setState(() {
        _translatetext = response.text!;
      });

      print(_translatetext);
    } catch (e) {
     
      print("the erorr is $e");
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Failed to translate text')),
      );
    } finally {
      setState(() {
        // _loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Color(0xFFC9D6FF), Color(0xFFE2E2E2)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                              color: const Color(0xFF601B7B), width: 0.2))),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Text Translation",
                            style: GoogleFonts.poppins(
                              fontSize: 18.0,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFF000000),
                            )),
                        const Icon(
                          Icons.text_fields,
                          color: Color(0xFF000000),
                          size: 24,
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 25.0, horizontal: 15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      LanguageDropdown(
                          onLanguageChanged: _handleLanguageChangefrom),
                      Icon(
                        Icons.swap_horiz_rounded,
                        color: Color(0xFF000000),
                      ),
                      LanguageDropdown(
                          onLanguageChanged: _handlecountryChangeto)
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
                                color: Color(0x00000000)),
                            children: <TextSpan>[
                              TextSpan(
                                  text: "Translate From:",
                                  style: GoogleFonts.poppins(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xFF000000))),
                              if (selectedcountryfrom != null)
                                TextSpan(
                                    text: selectedcountryfrom,
                                    style: GoogleFonts.poppins(
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xFF000000))),
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
                        color: Color(0xFFFFFFFF),
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
                                      color: Color(0xFF000000))),
                              if (selectedcountryfrom != null)
                                TextSpan(
                                    text: selectedcountryto,
                                    style: GoogleFonts.poppins(
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xFF000000))),
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
                        color: Color(0xFFFFFFFF),
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
                      padding: EdgeInsets.zero, // To avoid extra padding
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: () {
                      _translateText();
                    },
                    child: Ink(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Color(0xFF4A00E0), Color(0xFF8E2DE2)],
                          begin:
                              Alignment.topLeft, // Change direction for style
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Container(
                        height: 50,
                        alignment: Alignment.center,
                        child: Text(
                          'Submit',
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
        ),
      ),
    );
  }
}
