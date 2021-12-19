import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_starter_app/utils/constants.dart';
import 'package:google_fonts/google_fonts.dart';

AppBar PeoplesAppBar() {
  return AppBar(
    elevation: 0,
    backgroundColor: Colors.white,
    foregroundColor: Colors.black,
    centerTitle: false,
    title: AnimatedTextKit(

      animatedTexts: [
        TypewriterAnimatedText(Constants.AppName,
            textStyle: GoogleFonts.pacifico(
                textStyle: TextStyle(color: Colors.black, letterSpacing: .85, fontStyle: FontStyle.normal, fontSize: 28)
            )

        ) ,

      ],
      isRepeatingAnimation: false,),);
}