import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fyp_screens/features/driver_main_screen/screens/driver_cnic_screen.dart';
import 'package:fyp_screens/features/driver_main_screen/screens/driver_license_screen.dart';
import 'package:fyp_screens/features/driver_main_screen/screens/driver_main_screen.dart';
import 'package:fyp_screens/features/driver_main_screen/screens/id_confirmation_screeen.dart';
import 'package:fyp_screens/features/driver_main_screen/screens/practice_screen.dart';
import 'package:fyp_screens/features/driver_main_screen/screens/select_vehicle.dart';
import 'package:fyp_screens/features/driver_main_screen/screens/vehicle_picture_screen.dart';
import 'package:fyp_screens/features/driver_main_screen/screens/vehicle_registration_screen.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: DriverMainScreen(),
    );
  }
}
