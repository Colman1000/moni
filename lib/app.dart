import 'package:flutter/material.dart';
import 'package:moni/config/theme.dart';
import 'package:moni/screens/home/home.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: MoniTheme.light,
      darkTheme: MoniTheme.dark,
      initialRoute: Home.name,
      routes: {
        Home.name: (context) => const Home(),
      },
    );
  }
}
