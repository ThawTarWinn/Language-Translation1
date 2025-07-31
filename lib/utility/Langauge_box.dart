import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LangaugeBox extends StatefulWidget {
  final ValueChanged<Map<String, String>?> onLanguageChanged;
  const LangaugeBox({super.key, required this.onLanguageChanged});

  @override
  State<LangaugeBox> createState() => _LangaugeBoxState();
}

class _LangaugeBoxState extends State<LangaugeBox> {
  final List<Map<String, String>> languageData = [
    {
      'countryLanguage': 'English - US',
      'countryImage': 'assets/images/usa.png',
      'countrycode': 'en-US'
    },
    {
      'countryLanguage': 'Chinese',
      'countryImage': 'assets/images/china.png',
      'countrycode': 'zh-CN'
    },
    {
      'countryLanguage': 'Japan',
      'countryImage': 'assets/images/japan.png',
      'countrycode': 'ja'
    },
    {
      'countryLanguage': 'Thai',
      'countryImage': 'assets/images/thai.png',
      'countrycode': 'th'
    },
    {
      'countryLanguage': 'Poland',
      'countryImage': 'assets/images/poland.png',
      'countrycode': 'pl'
    },
    {
      'countryLanguage': 'Saudi',
      'countryImage': 'assets/images/arabic.png',
      'countrycode': 'ar'
    },
  ];
  Map<String, String>? selectedcountry;
  @override
  Widget build(BuildContext context) {
    return DropdownButton<Map<String, String>>(
      isDense: true,
      isExpanded: false,
      value: selectedcountry,
      hint: Text(
        "Select language",
        style: GoogleFonts.poppins(
          fontWeight: FontWeight.bold,
          fontSize: 12.0,
          color: Color(0xFF2F4F4F),
        ),
      ),
      icon: Icon(
        Icons.keyboard_arrow_down_outlined,
        color: Color(0xFF2F4F4F),
      ),
      underline: Container(
        color: Colors.transparent,
      ),
      dropdownColor: Color(0xFFFFFFFF),
      items: languageData.map((country) {
        return DropdownMenuItem<Map<String, String>>(
          value: country,
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
                    color: selectedcountry == country["countrycode"]
                        ? Color(0xFF2F4F4F)
                        : Color(0xFF2F4F4F)),
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
    );
  }
}
