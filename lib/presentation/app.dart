import 'package:flutter/material.dart';
import 'package:nocia/presentation/auth/auth_check.dart';

class App extends StatelessWidget {
  const App();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: AuthCheck()
    );
  }
}