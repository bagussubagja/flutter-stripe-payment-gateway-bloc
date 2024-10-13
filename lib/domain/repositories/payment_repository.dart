import 'package:flutter_stripe_payment_gateway_bloc/domain/entities/payment_intent.dart';

abstract class PaymentRepository {
  Future<PaymentIntentModel> createPaymentIntent(int amount, String currency);
  Future<void> processPayment(PaymentIntentModel paymentIntent);
}