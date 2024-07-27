import 'package:flutter/material.dart';
import 'package:gasolina_etanol/home_screen.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData.light(),
    darkTheme: ThemeData.dark(),
    themeMode: ThemeMode.system,
    home: const HomeScreen(),
  ));
}
