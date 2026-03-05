import 'package:flutter/material.dart';
import 'package:flutter_kin_cake_kun_app/views/splash_screen_ui.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const FlutterKinCakeKunApp());
}

class FlutterKinCakeKunApp extends StatelessWidget {
  const FlutterKinCakeKunApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const SplashScreenUi(),
      theme: ThemeData(
        textTheme: GoogleFonts.kanitTextTheme(),
      ),
    );
  }
}