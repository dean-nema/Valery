// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:valery/src/pages/credits.dart';
import 'package:valery/src/pages/tasks.dart';
import 'package:valery/src/utils/theme/theme.dart';

Future<void> main() async {
  //init hive
  await Hive.initFlutter();

  //box

  var box = await Hive.openBox("mybox");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
       initialRoute: '/task',
      routes: {
        '/task':(context) => TODO(),
        '/credits':(context) => Credits(),
      },
    );
  }
}
