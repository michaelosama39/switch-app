part of 'activation_cubit.dart';

class ActivationState{
  final OrdersModel? ordersModel;
  final RequestState ordersState;
  final String message;

  ActivationState({
    this.ordersModel,
    this.ordersState = RequestState.initial,
    this.message = '',
  });
}
