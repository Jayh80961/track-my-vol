import 'package:flutter/material.dart';

import '../routers/routers.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: goRouter,
      theme: ThemeData.from(
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.indigo,
          backgroundColor: Colors.white,
        ),
        useMaterial3: true,
      ),
    );
  }
}
