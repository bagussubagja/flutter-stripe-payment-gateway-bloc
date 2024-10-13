part of 'payment_bloc.dart';

abstract class PaymentEvent {}

class InitiatePaymentEvent extends PaymentEvent {
  final int amount;
  final String currency;

  InitiatePaymentEvent(this.amount, this.currency);
}
