import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:google_fonts/google_fonts.dart';

class TranslateTo extends StatefulWidget {
  final String trasnlsatetext;
  const TranslateTo({super.key, required this.trasnlsatetext});

  @override
  State<TranslateTo> createState() => _TranslateToState();
}

class _TranslateToState extends State<TranslateTo> {
  final FlutterTts _fluttrtts = FlutterTts();
  void _copytoClipboard(String text) {
    Clipboard.setData(ClipboardData(text: text)).then((_) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Open to Clip Board")),
      );
    });
  }

  Future<void> _handleTapToSpeak() async {
    final text = widget.trasnlsatetext;
    await _fluttrtts.speak(text);
  }

  @override
  void dispose() {
    _fluttrtts.stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
          child: Align(
            alignment: Alignment.topLeft,
            child: Text(
              widget.trasnlsatetext,
              style:
                  GoogleFonts.poppins(fontSize: 25.0, color: Color(0xFFF7E7CE)),
            ),
          ),
        ),
        Container(
          child: Row(
            spacing: 15,           
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: () {
                  _copytoClipboard(widget.trasnlsatetext);
                },
                child: Icon(Icons.copy_all_rounded,
                    size: 25, color: Color(0xFFF7E7CE)),
              ),
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
