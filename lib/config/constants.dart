import 'package:flutter/material.dart';

class Constants {
  const Constants._(); // this basically makes it so you can't instantiate this class

  static Uri api = Uri.parse('https://moni-staging-1.vercel.app/api/loans');
  static const String backgroundImage = 'assets/images/BG.png';
  static GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();
}
