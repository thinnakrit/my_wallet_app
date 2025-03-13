import 'package:flutter/material.dart';

class MyWalletTheme {
  static ThemeData get themeData {
    return ThemeData(
      scaffoldBackgroundColor: Colors.white,
      appBarTheme: AppBarTheme(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        titleTextStyle: TextStyle(
          color: Colors.black,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
        centerTitle: true,
      ),
      primarySwatch: Colors.blue,
      buttonTheme: ButtonThemeData(
        buttonColor: Colors.black,
        textTheme: ButtonTextTheme.primary,
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
      ),
    );
  }
}