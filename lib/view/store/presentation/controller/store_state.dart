part of 'store_cubit.dart';

@immutable
abstract class StoreState {}

class StoreInitial extends StoreState {}

class GetAllProduct extends StoreState {
  final ProductsModel? productsModel;
  final RequestState productsState;
  final String message;

  GetAllProduct({
    this.productsModel,
    this.productsState = RequestState.initial,
    this.message = '',
  });
}

class MakeOrderState extends StoreState {
  final MsgModel? msgModel;
  final RequestState makeOrderState;
  final String message;

  MakeOrderState({
    this.msgModel,
    this.makeOrderState = RequestState.initial,
    this.message = '',
  });
}
