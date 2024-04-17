import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:gallary_app/ui/pages/home.dart';

void main() {
  runApp(const MyApp());
}

// late final MediaQueryData mq;

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Gallary App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}
