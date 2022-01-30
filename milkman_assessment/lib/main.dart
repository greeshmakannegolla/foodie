import 'package:flutter/material.dart';
import 'package:milkman_assessment/providers/cart_provider.dart';
import 'package:milkman_assessment/splash_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [ChangeNotifierProvider(create: (context) => CartProvider())],
    child: MaterialApp(
        theme: ThemeData(fontFamily: 'Sen'),
        debugShowCheckedModeBanner: false,
        home: SplashScreen()),
  ));
}
