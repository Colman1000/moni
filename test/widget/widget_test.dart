import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:moni/app.dart';
import 'package:moni/config/constants.dart';
import 'package:moni/config/theme.dart';
import 'package:moni/providers/cluster_model.dart';
import 'package:moni/screens/home/home.dart';
import 'package:provider/provider.dart';

import '../helpers/mock_data.dart';
import '../helpers/test_http_client.dart';

//TestApp is needed to wrap app Test/Mock providers around the app before as
// opposed the actual providers.

class TestApp extends StatelessWidget {
  const TestApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        // Register Test/Mock providers here...
        ChangeNotifierProvider<ClusterModel>(
          create: (context) {
            final _mockRequest = MockRequest(
              Response(jsonEncode(mockClusterModelResponse), 200),
            );
            return ClusterModel(_mockRequest.request)
              ..query();
          },
        ),
      ],
      child: MaterialApp(
        theme: MoniTheme.light,
        darkTheme: MoniTheme.dark,
        initialRoute: Home.name,
        scaffoldMessengerKey: Constants.scaffoldMessengerKey,
        routes: {
          Home.name: (context) => const Home(), // Use the Home page
        },
      ),
    );
  }
}

void main() {
  testWidgets('Tabbing leads to different views test',
          (WidgetTester tester) async {
        await tester.pumpWidget(const TestApp());
        await tester.pump();

        expect(find.text('Test Cluster'), findsOneWidget);
        expect(find.text('Members (6)'), findsOneWidget);
        expect(find.text('Overdue Loans'),
            findsOneWidget); //should be on prev tab not current tab
        expect(find.text('Cluster purse setting'), findsNothing);

        final _foundWidget = find.byType(Tab).at(1);
        await tester.tap(_foundWidget);
        await tester.pump();
        // expect(find.text('Cluster purse settings'), findsOneWidget);
        expect(find.text('Test Cluster'), findsOneWidget);
        expect(find.text('Members (6)'), findsOneWidget);

      });
}
