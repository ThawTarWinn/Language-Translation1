import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CountryBox extends StatefulWidget {
  const CountryBox({super.key});

  @override
  State<CountryBox> createState() => _CountryBoxState();
}

class _CountryBoxState extends State<CountryBox> {
  final List<Map<String, String>> countrydata = [
    {'countryName': 'USA', 'countryImage': 'assets/images/usa.png'},
    {'countryName': 'China', 'countryImage': 'assets/images/china.png'},
    {'countryName': 'Japan', 'countryImage': 'assets/images/japan.png'},
    {'countryName': 'Thai', 'countryImage': 'assets/images/thai.png'},
    {'countryName': 'Poland', 'countryImage': 'assets/images/poland.png'},
    {'countryName': 'Saudi', 'countryImage': 'assets/images/arabic.png'},
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 15,
          mainAxisSpacing: 15,
          childAspectRatio: 1.5,
          shrinkWrap: true,
          children: countrydata.map((country) {
            return Card(
              color: Color(0xFFF7E7CE),
              elevation: 4,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0), side: BorderSide()),
              child: SizedBox(
                width: 100.0,
                child: Column(
                  spacing: 5,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      country['countryImage']!,
                      height: 20.0,
                      fit: BoxFit.cover,
                    ),
                    const SizedBox(width: 8.0),
                    Text(
                      country['countryName']!,
                      style: GoogleFonts.poppins(
                        fontSize: 14.0,
                        color: Color(0xFF2F4F4F),
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ],
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
