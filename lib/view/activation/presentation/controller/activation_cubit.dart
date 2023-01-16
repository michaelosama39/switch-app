import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:switch_app/view/activation/data/model/orders_model.dart';
import 'package:switch_app/view/activation/domain/usecases/get_orders.dart';

import '../../../../core/utils/app_enums.dart';
import '../../../../widgets/snackBar.dart';

part 'activation_state.dart';

class ActivationCubit extends Cubit<ActivationState> {
  ActivationCubit(this.getOrdersUseCase) : super(ActivationState());

  final GetOrders getOrdersUseCase;

  static ActivationCubit of(context) => BlocProvider.of(context);

  List<OrdersData> listOfOrders = [];

  Future getOrders() async {
    emit(ActivationState(
      ordersState: RequestState.loading,
    ));
    final res = await getOrdersUseCase.execute();
    res.fold(
      (err) {
        showSnackBar(err.message);
        emit(ActivationState(
          message: err.message,
          ordersState: RequestState.error,
        ));
      },
      (res) async {
        for (var element in res.data!) {
          if (element.status == 'done') {
            listOfOrders.add(element);
          }
        }
        emit(ActivationState(
          ordersModel: res,
          ordersState: RequestState.loaded,
        ));
      },
    );
  }
}
