import 'dart:async';

import 'package:flavor/flavor_assets.dart';
import 'package:flavor/flavor_theme.dart';
import 'package:flutter/material.dart';
import 'package:milkman_assessment/restaurant_listing_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 1),
        () => Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => RestaurantListingScreen())));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: FlavorTheme.kSplashBackgroundColor,
        child: Image.asset(
          FlavorAssets.kLogo,
        ));
  }
}
