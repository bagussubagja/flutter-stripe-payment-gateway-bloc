class PaymentIntentModel {
  final String clientSecret;
  final int amount;
  final String currency;

  PaymentIntentModel({required this.clientSecret, required this.amount, required this.currency});
}
