import 'package:flutter/material.dart';
import './app_menu.dart';

void main() {
  runApp(const MyApp());
}

// 1. extend from ConsumerWidget
class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // 3. watch selectedPageBuilderProvider
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      routes: appRoutes,
      initialRoute: 'p1',
    );
  }
}
