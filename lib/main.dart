import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'screens/home_screen.dart';
import 'init_app.dart';

void main ()async{
  await iniApp();
  runApp(const MovieBrowserApp());
}

class MovieBrowserApp extends StatelessWidget {
  const MovieBrowserApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home:  HomeScreen(),
    );
  }
}
