import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:nosh_assignment/views/home/internet_connectivity/no_internet.dart';

import 'home/home.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({
    super.key,
  });

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _checkInternetAndNavigate();
  }

  Future<void> _checkInternetAndNavigate() async {
    final result = await Connectivity().checkConnectivity();
    if (result == ConnectivityResult.none) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => NoInternetScreen()),
      );
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
