import 'package:flutter/material.dart';

import 'home_page.dart';
import 'login_page.dart';
import 'my_page.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Track My Vol',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: buildPageView(),
    );
  }

  Widget buildPageView() {
    return PageView(
      children: const [
        HomePage(),
        LoginPage(),
        MyPage(),
      ],
    );
  }
}
