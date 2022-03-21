import 'package:flutter/material.dart';
import 'package:moni/config/theme.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: MoniTheme.light,
      darkTheme: MoniTheme.dark,
    );
  }
}
