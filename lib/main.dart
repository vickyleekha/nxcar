import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'Screens/onboardingscreen.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nxcar',
      theme: _buildTheme(Brightness.light, context),
      home: const OnBoardingScreen(),
    );
  }

  // modify an entire text theme to use the "NotoSans" font.
  ThemeData _buildTheme(brightness, context) {
    var baseTheme = ThemeData(brightness: brightness);

    final textTheme = Theme.of(context).textTheme;

    return baseTheme.copyWith(
      textTheme: GoogleFonts.notoSansTextTheme(textTheme).copyWith(
        bodyMedium: GoogleFonts.oswald(textStyle: textTheme.bodyMedium),
      ),
    );
  }
}
