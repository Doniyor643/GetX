
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:patterns_getx/pages/create_page.dart';
import 'package:patterns_getx/pages/home_page.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
      getPages: [
        GetPage(name: '/home_page', page:() => const HomePage()),
        GetPage(name: '/create_page', page:() => const CreateUser())
      ],
    );
  }
}