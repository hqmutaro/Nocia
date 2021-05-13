import 'package:flutter/material.dart';
import 'package:nocia/presentation/auth/page.dart';

class App extends StatelessWidget {
  const App();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: AuthPage()
    );
  }
}