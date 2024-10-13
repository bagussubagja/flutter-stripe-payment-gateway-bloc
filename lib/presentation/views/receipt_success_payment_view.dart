import 'package:flutter/material.dart';

class ReceiptSuccessPaymentView extends StatefulWidget {
  const ReceiptSuccessPaymentView({super.key});

  @override
  State<ReceiptSuccessPaymentView> createState() =>
      _ReceiptSuccessPaymentViewState();
}

class _ReceiptSuccessPaymentViewState extends State<ReceiptSuccessPaymentView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text('Payment Success!'),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Back to Home'))
          ],
        ),
      ),
    );
  }
}
