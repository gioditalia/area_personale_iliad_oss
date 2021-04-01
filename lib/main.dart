import 'package:flutter/material.dart';
import 'package:area_personale_iliad_oss/iliadAreaPersonale.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Area Personale Iliad',
      theme: ThemeData(
          brightness: Brightness.light,
          primaryColor: Colors.red,
          bottomNavigationBarTheme: BottomNavigationBarThemeData(
              selectedItemColor: Colors.red,
              unselectedItemColor: Colors.black54),
          floatingActionButtonTheme:
              FloatingActionButtonThemeData(backgroundColor: Colors.red)),
      darkTheme: ThemeData(
          brightness: Brightness.dark,
          primaryColor: Colors.red,
          accentColor: Colors.red[600],
          bottomNavigationBarTheme: BottomNavigationBarThemeData(
              selectedItemColor: Colors.red,
              unselectedItemColor: Colors.white54),
          floatingActionButtonTheme:
              FloatingActionButtonThemeData(backgroundColor: Colors.red)),
      themeMode: ThemeMode.system,
      // This is the theme of your application.
      //
      // Try running your application with "flutter run". You'll see the
      // application has a blue toolbar. Then, without quitting the app, try
      // changing the primarySwatch below to Colors.green and then invoke
      // "hot reload" (press "r" in the console where you ran "flutter run",
      // or simply save your changes to "hot reload" in a Flutter IDE).
      // Notice that the counter didn't reset back to zero; the application
      // is not restarted.
      home: AreaPersonale(),
    );
  }
}
