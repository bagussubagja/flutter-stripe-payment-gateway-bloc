import 'package:flutter_stripe_payment_gateway_bloc/presentation/blocs/payment_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import 'data/repositories/payment_repository_impl.dart';
import 'domain/repositories/payment_repository.dart';
import 'domain/usecases/make_payment_usecase.dart';

final GetIt sl = GetIt.instance;

void setupDependencies() {
  // Dio
  sl.registerLazySingleton(() => Dio());

  // Repositories
  sl.registerLazySingleton<PaymentRepository>(
    () => PaymentRepositoryImpl(sl()),
  );

  // Use cases
  sl.registerLazySingleton(() => MakePaymentUseCase(sl()));

  // BLoCs
  sl.registerFactory(() => PaymentBloc(sl()));
}