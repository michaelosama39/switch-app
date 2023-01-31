import 'dart:typed_data';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nfc_manager/nfc_manager.dart';
import 'package:switch_app/core/router/router.dart';
import 'package:switch_app/view/activation/data/model/orders_model.dart';
import 'package:switch_app/view/activation/domain/usecases/activation_product.dart';
import 'package:switch_app/view/activation/domain/usecases/get_orders.dart';

import '../../../../core/appStorage/app_storage.dart';
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

  Future tagNFCReadAndWrite() async {
    NfcManager.instance.startSession(
      onDiscovered: (NfcTag tag) async {
        final ndef = Ndef.from(tag);
        String tagRecordText =
            String.fromCharCodes(ndef!.cachedMessage!.records[0].payload);
        MagicRouter.pop();
        activationProduct(tagRecordText.split('en')[1]);
        if (ndef == null || !ndef.isWritable) {
          NfcManager.instance
              .stopSession(errorMessage: 'Tag is not ndef writable');
          return;
        }

        NdefMessage message = NdefMessage([
          NdefRecord.createText(''),
          NdefRecord.createUri(Uri.parse(
              'https://switch-profile.technomasrsystems.com/${AppStorage.getUserId}')),
          NdefRecord.createMime(
              'text/plain', Uint8List.fromList('Hello'.codeUnits)),
          NdefRecord.createExternal(
              'com.example', 'mytype', Uint8List.fromList('mydata'.codeUnits)),
        ]);

        try {
          await ndef.write(message);
          print('Success to "Ndef Write"');
          NfcManager.instance.stopSession();
        } catch (e) {
          NfcManager.instance.stopSession(errorMessage: e.toString());
          return;
        }
      },
    );
  }
}
