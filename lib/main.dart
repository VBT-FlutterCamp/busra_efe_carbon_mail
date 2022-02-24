import 'package:flutter/material.dart';
import 'package:hm_carbon_mail/feature/onboard/onboard_view.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Carbon Mail',
      home: OnboardView(),
    );
  }
}
