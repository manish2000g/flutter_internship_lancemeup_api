import 'package:api_project/screens/delete.dart';
import 'package:api_project/screens/get.dart';
import 'package:api_project/screens/home.dart';
import 'package:api_project/screens/patch.dart';
import 'package:api_project/screens/post.dart';
import 'package:flutter/material.dart';

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
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/home': (context) => const Home(),
        '/get': (context) => const GetClass(),
        '/post': (context) => const PostClass(),
        '/patch': (context) => const PatchClass(),
        '/delete': (context) => const DeleteClass(),
      },
      initialRoute: '/home',
    );
  }
}
