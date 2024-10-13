

import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

import '../../domain/entities/payment_intent.dart';
import '../../domain/repositories/payment_repository.dart';

class PaymentRepositoryImpl implements PaymentRepository {
  final Dio _dio;

  PaymentRepositoryImpl(this._dio);

  @override
  Future<PaymentIntentModel> createPaymentIntent(int amount, String currency) async {
    try {
      final response = await _dio.post(
        "https://api.stripe.com/v1/payment_intents",
        data: {
          "amount": amount * 100,
          "currency": currency,
        },
        options: Options(
          contentType: Headers.formUrlEncodedContentType,
          headers: {
            "Authorization": "Bearer ${dotenv.env['SECRET_KEY']}",
            "Content-Type": 'application/x-www-form-urlencoded'
          },
        ),
      );

      if (response.data != null && response.data["client_secret"] != null) {
        return PaymentIntentModel(
          clientSecret: response.data["client_secret"],
          amount: amount,
          currency: currency,
        );
      }
      throw Exception("Failed to create payment intent");
    } catch (e) {
      throw Exception("Error creating payment intent: $e");
    }
  }

  @override
  Future<void> processPayment(PaymentIntentModel paymentIntent) async {
    try {
      await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
          paymentIntentClientSecret: paymentIntent.clientSecret,
          merchantDisplayName: "Flutter Stripe Payment Gateway BLoC",
          customFlow: true,
        ),
      );
      await Stripe.instance.presentPaymentSheet();
      await Stripe.instance.confirmPaymentSheetPayment();
    } on StripeException catch (e) {
      throw Exception(e.error.localizedMessage);
    } catch (e) {
      throw Exception("An error occurred during payment processing: $e");
    }
  }
}