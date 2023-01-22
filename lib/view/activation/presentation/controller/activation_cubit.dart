import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nfc_manager/nfc_manager.dart';
import 'package:switch_app/core/router/router.dart';
import 'package:switch_app/view/activation/data/model/orders_model.dart';
import 'package:switch_app/view/activation/domain/usecases/activation_product.dart';
import 'package:switch_app/view/activation/domain/usecases/get_orders.dart';

import '../../../../core/utils/app_enums.dart';
import '../../../../widgets/snackBar.dart';

part 'activation_state.dart';

class ActivationCubit extends Cubit<ActivationState> {
  ActivationCubit(this.getOrdersUseCase, this.activationProductUseCase)
      : super(ActivationState());

  final GetOrders getOrdersUseCase;
  final ActivationProduct activationProductUseCase;

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

  Future activationProduct(String? serialNumber) async {
    emit(ActivationState(
      ordersState: RequestState.loading,
    ));
    final res = await activationProductUseCase.execute(serialNumber!);
    res.fold(
      (err) {
        showSnackBar(err.message);
        emit(ActivationState(
          message: err.message,
          ordersState: RequestState.error,
        ));
      },
      (res) async {
        showSnackBar(res.message!);
        emit(ActivationState(
          ordersState: RequestState.loaded,
        ));
      },
    );
  }

  void tagNFCRead() {
    NfcManager.instance.startSession(onDiscovered: (NfcTag tag) async {
      // result.value = tag.data;
      final ndef = Ndef.from(tag);
      String tagRecordText =
          String.fromCharCodes(ndef!.cachedMessage!.records[0].payload);
      MagicRouter.pop();
      activationProduct(tagRecordText.split('en')[1]);
      NfcManager.instance.stopSession();
    });
  }
}
