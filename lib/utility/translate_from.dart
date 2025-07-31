import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:google_fonts/google_fonts.dart';

class TranslateFrom extends StatefulWidget {
  final TextEditingController controller;
  const TranslateFrom({super.key, required this.controller});

  @override
  State<TranslateFrom> createState() => _TranslateFromState();
}

class _TranslateFromState extends State<TranslateFrom> {

  final FlutterTts _fluttrtts = FlutterTts();
  @override
  void initState() {
    super.initState();
  }

  Future<void> _handleTapToSpeak() async {
    final text = widget.controller.text;
    await _fluttrtts.speak(text);
  }

  @override
  void dispose() {
    _fluttrtts.stop();
    widget.controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          textAlign: TextAlign.start,
          controller: widget.controller,
          maxLines: 4,
          style: GoogleFonts.poppins(fontSize: 20.0, color: Color(0xFFF7E7CE)),
          decoration: InputDecoration(
            hintText: "Enter the text your want to translate",
            hintStyle: GoogleFonts.poppins(
              fontSize: 20.0,
              color: Color(0xFFF7E7CE),
            ),
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
            labelStyle: GoogleFonts.poppins(
              fontSize: 20.0,
              color: Color(0xFFF7E7CE),
            ),
          ),
        ),
        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: _handleTapToSpeak,
                child: Icon(
                  Icons.volume_up_rounded,
                  size: 25,
                  color: Color(0xFFF7E7CE),
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
