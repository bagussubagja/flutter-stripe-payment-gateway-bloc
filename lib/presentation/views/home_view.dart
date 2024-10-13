import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_stripe_payment_gateway_bloc/presentation/views/receipt_success_payment_view.dart';

import '../blocs/payment_bloc.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: BlocConsumer<PaymentBloc, PaymentState>(
        listener: (context, state) {
          if (state is PaymentSuccess) {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const ReceiptSuccessPaymentView()));
          } else if (state is PaymentFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Payment failed: ${state.error}')),
            );
          } else if (state is PaymentCancelled) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Payment was cancelled')),
            );
          }
        },
        builder: (context, state) {
          return Center(
            child: state is PaymentLoading
                ? const CircularProgressIndicator()
                : ElevatedButton(
                    onPressed: () => context
                        .read<PaymentBloc>()
                        .add(InitiatePaymentEvent(100, 'usd')),
                    child: const Text('Pay Now!'),
                  ),
          );
        },
      ),
    );
  }
}
