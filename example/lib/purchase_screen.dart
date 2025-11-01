import 'package:example/card_payment_tab.dart';
import 'package:example/checkout_tab.dart';
import 'package:flutter/material.dart';
import 'package:liqpay/liqpay.dart';

class PurchaseScreen extends StatefulWidget {
  const PurchaseScreen({super.key});

  @override
  State<PurchaseScreen> createState() => _PurchaseScreenState();
}

class _PurchaseScreenState extends State<PurchaseScreen>
    with SingleTickerProviderStateMixin {
  late LiqPay liqPay;
  late TabController _tabController;

  @override
  void initState() {
    super.initState();

    _tabController = TabController(length: 2, vsync: this);

    liqPay = LiqPay(
      "sandbox_i93741880090",
      "sandbox_2seuG5TNNngUIqwBXVqwzPWjtIXDXUNLwdn0cPKM",
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("LiqPay Package Demo"),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(icon: Icon(Icons.credit_card), text: "Card Payment"),
            Tab(icon: Icon(Icons.shopping_bag), text: "Checkout"),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          CardPaymentTab(liqPay: liqPay),
          CheckoutTab(liqPay: liqPay),
        ],
      ),
    );
  }
}
