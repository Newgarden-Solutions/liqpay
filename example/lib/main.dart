import 'package:example/purchase_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(const App());

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'LiqPay Package Demo',
      theme: ThemeData(primarySwatch: Colors.green),
      home: const PurchaseScreen(),
    );
  }
}
