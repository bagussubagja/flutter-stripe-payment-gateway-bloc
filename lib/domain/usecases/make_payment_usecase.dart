
import '../repositories/payment_repository.dart';

class MakePaymentUseCase {
  final PaymentRepository repository;

  MakePaymentUseCase(this.repository);

  Future<void> execute(int amount, String currency) async {
    final paymentIntent = await repository.createPaymentIntent(amount, currency);
    await repository.processPayment(paymentIntent);
  }
}