import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app/todo_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,


        // Define the default brightness and colors.
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
          // ···
          // brightness: Brightness.dark,
        ),

        buttonTheme: ButtonThemeData(
          shape: const LinearBorder(),
          buttonColor: Colors.green,
          colorScheme: ColorScheme.fromSeed(
        seedColor: Colors.green,
        ),
        ),
        // Define the default `TextTheme`. Use this to specify the default
        // text styling for headlines, titles, bodies of text, and more.
        textTheme: TextTheme(
          displayLarge: const TextStyle(
            fontSize: 72,
            fontWeight: FontWeight.bold
          ),
          // ···
          titleLarge: GoogleFonts.pacifico(
            fontSize: 26
          ),
          bodyMedium: GoogleFonts.merriweather(
          ),
          displaySmall: GoogleFonts.pacifico(

          ),
        ),
        appBarTheme: const AppBarTheme(
          color: Colors.blueAccent,
        ),
      ),

      home: const TodoPage(),
    );
  }
}

