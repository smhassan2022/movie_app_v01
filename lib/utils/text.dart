import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';


class modified_text extends StatelessWidget {

  final String text;
  final Color  color;
  final double size;

  const modified_text({Key? key, required this.text, required this.size, required this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text, style: GoogleFonts.breeSerif(
        color: color, fontSize: size
      ),
    );
  }
}
