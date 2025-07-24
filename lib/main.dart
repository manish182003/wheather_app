import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import 'package:wheather_app/config/dependency/app_dependency.dart';
import 'package:wheather_app/views/home/screens/home_screen.dart';

void main() async {
  await dotenv.load();
  runApp(
    Sizer(
      builder: (p0, p1, p2) {
        return MyApp();
      },
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Weather App',
      debugShowCheckedModeBanner: false,

      home: const HomePage(),
      initialBinding: AppDependency(),
    );
  }
}
