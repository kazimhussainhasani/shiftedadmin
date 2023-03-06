import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    Key? key,
    required this.name,
    required this.onPress,
  }) : super(key: key);

  final String name;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.white,
      elevation: 2.0,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.grey[300],
          ),
          onPressed: onPress,
          child: Text(
            name,
            style: GoogleFonts.kadwa(color: Colors.white, fontSize: 20.0),
          ),
        ),
      ),
    );
  }
}
