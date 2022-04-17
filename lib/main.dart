import 'package:flutter/material.dart';

import 'config/config.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    appTheme = AppTheme();
    appTheme.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    appTheme.removeListener(() {});
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Animations',
      debugShowCheckedModeBanner: false,
      theme: appTheme.light,
      darkTheme: appTheme.dark,
      themeMode: appTheme.themeMode,
      initialRoute: Routes.root,
      routes: RouteConfig.routes,
      onGenerateRoute: RouteHandler.generateRoute,
    );
  }
}
