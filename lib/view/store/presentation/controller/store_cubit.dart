import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:switch_app/core/models/msg_model.dart';
import 'package:switch_app/core/router/router.dart';
import 'package:switch_app/view/store/domain/usecases/get_all_products.dart';
import 'package:switch_app/view/store/domain/usecases/make_order.dart';
import '../../../../core/utils/app_enums.dart';
import '../../../../widgets/snackBar.dart';
import '../../data/model/products_model.dart';

part 'store_state.dart';

class StoreCubit extends Cubit<StoreState> {
  StoreCubit(this.getAllProductsUseCase , this.makeOrderUseCase) : super(StoreInitial());
  final GetAllProducts getAllProductsUseCase;
  final MakeOrder makeOrderUseCase;

  static StoreCubit of(context) => BlocProvider.of(context);

  List<ProductsData> listOfProductsData = [];

  Future getAllProducts() async {
    emit(GetAllProduct(
      productsState: RequestState.loading,
    ));
    final res = await getAllProductsUseCase.execute();
    res.fold(
      (err) {
        showSnackBar(err.message);
        emit(GetAllProduct(
          message: err.message,
          productsState: RequestState.error,
        ));
      },
      (res) async {
        listOfProductsData.addAll(res.data!);
        emit(GetAllProduct(
          productsModel: res,
          productsState: RequestState.loaded,
        ));
      },
    );
  }

  Future makeOrder(int productId) async {
    emit(MakeOrderState(
      makeOrderState: RequestState.loading,
    ));
    final res = await makeOrderUseCase.execute(productId);
    res.fold(
      (err) {
        showSnackBar(err.message);
        emit(MakeOrderState(
          message: err.message,
          makeOrderState: RequestState.error,
        ));
      },
      (res) async {
        showSnackBar(res.message!);
        emit(MakeOrderState(
          message: res.message!,
          msgModel: res,
          makeOrderState: RequestState.loaded,
        ));
        MagicRouter.pop();
      },
    );
  }
}
