import 'package:flutter/material.dart';
import 'package:language_translation/Screens/HomePageDesign.dart';
import 'package:language_translation/Screens/TranslateTextPage.dart';

class Togglepage extends StatefulWidget {
  const Togglepage({super.key});

  @override
  State<Togglepage> createState() => _TogglepageState();
}

class _TogglepageState extends State<Togglepage> {
  bool _showhomepage = true;
  void _togglescreen() {
    setState(() {
      _showhomepage = !_showhomepage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_showhomepage) {
      return Homepagedesign(showPormptPage: _togglescreen);
    } else {
      return Translatetextpage(showHomePage: _togglescreen);
    }
  }
}
