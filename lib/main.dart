import 'package:flutter/material.dart';
import 'package:split_view_named_routes/constants/drawer_routes.dart';
import 'constants/drawer_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      onGenerateRoute: drawerRoutes.generateRoute,
      initialRoute: '/',
    );
  }
}
