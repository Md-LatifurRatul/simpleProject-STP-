import 'package:first_app/sum_app/sum_app_screen.dart';
import 'package:flutter/material.dart';

class SumApp extends StatelessWidget {
  const SumApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const SumAppScreen(),
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          centerTitle: true,
          color: Colors.green,
          titleTextStyle: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w400,
            color: Colors.white,
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: const BorderSide(color: Colors.white)),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.brown),
          ),
          disabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey)),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.brown),
          ),
          errorBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red),
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.yellow,
            foregroundColor: Colors.black,
          ),
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          selectedItemColor: Colors.purple,
          backgroundColor: Colors.cyan,
        ),
      ),
    );
  }
}
