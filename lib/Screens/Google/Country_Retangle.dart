import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CountryRetangle extends StatefulWidget {
  const CountryRetangle({super.key});

  @override
  State<CountryRetangle> createState() => _CountryRetangleState();
}

class _CountryRetangleState extends State<CountryRetangle> {
  final Random random = Random();
  final List<Map<String, String>> countrydata = [
    {'countryName': 'USA', 'countryImage': 'assets/images/usa.png'},
    {'countryName': 'Russia', 'countryImage': 'assets/images/russia.png'},
    {'countryName': 'Italy', 'countryImage': 'assets/images/italy.png'},
    {'countryName': 'Germany', 'countryImage': 'assets/images/germany.png'},
    {'countryName': 'France', 'countryImage': 'assets/images/france.png'},
    {'countryName': 'China', 'countryImage': 'assets/images/china.png'},
    {'countryName': 'England', 'countryImage': 'assets/images/britain.png'},
    {'countryName': 'Saudi', 'countryImage': 'assets/images/arabic.png'},
  ];
  String? selectedcountry;
  Color? backgorundcolor;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _randomize();
  }

  void _randomize() {
    setState(() {
      selectedcountry =
          countrydata[random.nextInt(countrydata.length)]["countryName"];
      backgorundcolor =
          Color((random.nextDouble() * 0xFFFFFFFF).toInt()).withAlpha(10);
    });
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 15,
          mainAxisSpacing: 15,
          childAspectRatio: 3.0,
          shrinkWrap: true,
          children: countrydata.map((country) {
            bool isSelected = country["countryName"] == selectedcountry;
            return Card(
              elevation: 4,
              color: isSelected ? backgorundcolor : const Color(0xFFFFFFFF),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  side: BorderSide(
                    color: isSelected
                        ? Colors.transparent
                        : const Color(0xFFFFFFFF).withAlpha(5),
                  )),
              child: Container(
                width: 100.0,
                padding: const EdgeInsets.symmetric(
                    vertical: 10.0, horizontal: 10.0),
                child: Row(
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
                          fontWeight: FontWeight.w300,
                          color: isSelected
                              ? const Color(0xFFFFFFFF)
                              : const Color(0xFF000000)),
                    ),
                  ],
                ),
              ),
            );
          }).toList(),
        ),
        onRefresh: () async {
          _randomize();
        });
  }
}
