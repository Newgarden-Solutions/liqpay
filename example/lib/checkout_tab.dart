import 'package:example/browser_screen.dart';
import 'package:flutter/material.dart';
import 'package:liqpay/liqpay.dart';
import 'package:uuid/uuid.dart';

class CheckoutTab extends StatelessWidget {
  final LiqPay liqPay;

  const CheckoutTab({super.key, required this.liqPay});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.shopping_bag_outlined,
            size: 100,
            color: Colors.green,
          ),
          const SizedBox(height: 20),
          const Text(
            'Checkout Payment',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          const Text(
            'Complete your purchase through LiqPay secure checkout page',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),
          const SizedBox(height: 40),
          ElevatedButton(
            onPressed: () async {
              final order = LiqPayOrder(
                const Uuid().v4(),
                1,
                'Test',
                serverUrl: "https://example.com",
                action: LiqPayAction.pay,
              );
              final url = await liqPay.checkout(order);

              if (!context.mounted) return;

              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => BrowserScreen(url: url, title: "Checkout"),
                ),
              );
            },
            child: const Text("CHECKOUT", style: TextStyle(fontSize: 18)),
          ),
        ],
      ),
    );
  }
}
