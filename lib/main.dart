import 'package:avoota/cancelledbookings.dart';
import 'package:avoota/completedbookings.dart';
import 'package:avoota/reviewScreen.dart';
import 'package:avoota/sideandnavbar.dart';
import 'package:avoota/upcomingbookings.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      debugShowCheckedModeBanner: false,
      title: 'Avoota Demo',
      initialRoute: '/', // Initial route is set to SideAndNavBar
      routes: {
        '/': (context) => SideAndNavBar(), // Your main page
        '/upcomingBookingDetails': (context) => const UpcomingBookingDetails(),
        '/completedBookingDetails': (context) => const CompletedBookingDetails(),
        '/cancelledBookingDetails': (context) => const CancelledBookingDetails(),
        '/reviewScreen': (context) => ReviewScreen(),
      },
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
