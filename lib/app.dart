import 'package:flutter/material.dart';
import 'package:moni/config/constants.dart';
import 'package:moni/config/theme.dart';
import 'package:http/http.dart' as http;
import 'package:moni/providers/cluster_model.dart';
import 'package:moni/screens/home/home.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    precacheImage(
      const AssetImage(Constants.backgroundImage),
      context,
    ); //preload background image

    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ClusterModel>(
          create: (context) => ClusterModel(http.get)..query(),
        ),
      ],
      child: MaterialApp(
        theme: MoniTheme.light,
        darkTheme: MoniTheme.dark,
        initialRoute: Home.name,
        scaffoldMessengerKey: Constants.scaffoldMessengerKey,
        routes: {
          Home.name: (context) => const Home(),
        },
      ),
    );
  }
}
