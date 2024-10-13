import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/usecases/make_payment_usecase.dart';
part 'payment_event.dart';
part 'payment_state.dart';


class PaymentBloc extends Bloc<PaymentEvent, PaymentState> {
  final MakePaymentUseCase makePaymentUseCase;

  PaymentBloc(this.makePaymentUseCase) : super(PaymentInitial()) {
    on<InitiatePaymentEvent>(_onInitiatePayment);
  }

  Future<void> _onInitiatePayment(
    InitiatePaymentEvent event,
    Emitter<PaymentState> emit,
  ) async {
    emit(PaymentLoading());
    try {
      await makePaymentUseCase.execute(event.amount, event.currency);
      emit(PaymentSuccess());
    } catch (e) {
      if (e.toString().contains("canceled")) {
        emit(PaymentCancelled());
      } else {
        emit(PaymentFailure(e.toString()));
      }
    }
  }
}