import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LanguageDropdown extends StatefulWidget {
  final ValueChanged<String?> onLanguageChanged;
  const LanguageDropdown({super.key, required this.onLanguageChanged});

  @override
  State<LanguageDropdown> createState() => _LanguageDropdownState();
}

class _LanguageDropdownState extends State<LanguageDropdown> {
  final List<Map<String, String>> languageData = [
    {
      'countryLanguage': 'English - US',
      'countryImage': 'assets/images/usa.png'
    },
    {
      'countryLanguage': 'English - UK',
      'countryImage': 'assets/images/britain.png'
    },
    {'countryLanguage': 'Russian', 'countryImage': 'assets/images/russia.png'},
    {'countryLanguage': 'Italian', 'countryImage': 'assets/images/italy.png'},
    {'countryLanguage': 'German', 'countryImage': 'assets/images/germany.png'},
    {'countryLanguage': 'French', 'countryImage': 'assets/images/france.png'},
    {'countryLanguage': 'Spanish', 'countryImage': 'assets/images/spain.png'},
  ];
  String? selectedcountry;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: Color(0xFFFFFFFF),
          border: Border.all(
            color: const Color(0xFF601B7B),
            width: 0.2,
          )),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: DropdownButton<String>(
          value: selectedcountry,
          hint: Text(
            "Select Language",
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.bold,
              fontSize: 14.0,
              color: Color(0xFF000000),
            ),
          ),
          icon: Icon(
            Icons.keyboard_arrow_down_outlined,
            color: Color(0xFF000000),
          ),
          underline: Container(
            color: Colors.transparent,
          ),
          dropdownColor: Color(0xFFFFFFFF),
          items: languageData.map((country) {
            return DropdownMenuItem<String>(
              value: country["countryLanguage"],
              child: Row(
                spacing: 10,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ClipOval(
                    child: Image.asset(
                      country["countryImage"]!,
                      width: 25.0,
                      height: 25.0,
                      fit: BoxFit.contain,
                    ),
                  ),
                  Text(
                    country["countryLanguage"]!,
                    style: GoogleFonts.poppins(
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold,
                        color: selectedcountry == country["countryLanguage"]
                            ? Color(0xFF000000)
                            : Color(0xFF000000)),
                  ),
                ],
              ),
            );
          }).toList(),
          onChanged: (newvalue) {
            setState(() {
              selectedcountry = newvalue;
            });
            widget.onLanguageChanged(newvalue);
          },
        ),
      ),
    );
  }
}
