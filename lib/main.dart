// ignore_for_file: prefer_const_constructors
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:online_buss_tickets/booking/booking_screen.dart';
import 'package:online_buss_tickets/booking/date_picker.dart';
import 'package:online_buss_tickets/splash_screen.dart';

import 'booking/booking_screen2.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '',
      home: MyBookingScreen(),
    );
  }
}
