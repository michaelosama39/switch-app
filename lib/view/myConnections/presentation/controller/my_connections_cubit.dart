import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:switch_app/core/utils/app_enums.dart';
import 'package:switch_app/view/myConnections/data/model/connection_model.dart';
import 'package:switch_app/view/myConnections/domain/usecases/add_new_connection.dart';
import 'package:switch_app/view/myConnections/domain/usecases/favourite_status.dart';
import 'package:switch_app/view/myConnections/domain/usecases/get_connection_list.dart';
import 'package:switch_app/view/myConnections/domain/usecases/get_exchange_list.dart';
import 'package:switch_app/view/myConnections/domain/usecases/get_favourite_list.dart';

import '../../../../core/router/router.dart';
import '../../../../widgets/snackBar.dart';
import '../../domain/usecases/exchange_status.dart';

part 'my_connections_state.dart';

class MyConnectionsCubit extends Cubit<MyConnectionsState> {
  MyConnectionsCubit(
      this.exchangeStatusUseCase,
      this.getExchangeListUseCase,
      this.getConnectionListUseCase,
      this.addNewConnectionUseCase,
      this.favouriteStatusUseCase,
      this.getFavouriteListUseCase)
      : super(MyConnectionsInitial());

  static MyConnectionsCubit of(context) => BlocProvider.of(context);

  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final titleController = TextEditingController();
  final phoneController = TextEditingController();
  final contentController = TextEditingController();

  final ExchangeStatus exchangeStatusUseCase;
  final GetExchangeList getExchangeListUseCase;
  final GetConnectionList getConnectionListUseCase;
  final AddNewConnection addNewConnectionUseCase;
  final FavouriteStatus favouriteStatusUseCase;
  final GetFavouriteList getFavouriteListUseCase;
  List<ConnectionData> listOfExchangeData = [];
  List<ConnectionData> listOfConnectionData = [];
  List<ConnectionData> listOfFavouriteData = [];

  MyConnection myConnection = MyConnection.connections;

  changeTabButton(String type) {
    if (type == 'connection') {
      myConnection = MyConnection.connections;
    } else if (type == 'exchange') {
      myConnection = MyConnection.exchange;
    }
    emit(ChangeTabButtonState());
  }

  Future exchangeStatus(int exchangeId, int status) async {
    emit(ExchangeStatusLoading());
    final res = await exchangeStatusUseCase.execute(exchangeId, status);
    res.fold(
      (err) {
        showSnackBar(err.message);
        emit(MyConnectionsInitial());
      },
      (res) async {
        listOfExchangeData.clear();
        emit(ExchangeStatusLoaded());
        getExchangeList();
        MagicRouter.pop();
        showSnackBar(res.message!);
      },
    );
  }

  Future getExchangeList() async {
    emit(GetExchangeListLoading());
    final res = await getExchangeListUseCase.execute();
    res.fold(
      (err) {
        showSnackBar(err.message);
        emit(MyConnectionsInitial());
      },
      (res) async {
        listOfExchangeData.clear();
        listOfExchangeData.addAll(res.data!);
        emit(GetExchangeListLoaded());
      },
    );
  }

  Future getConnectionList() async {
    emit(GetConnectionListLoading());
    final res = await getConnectionListUseCase.execute();
    res.fold(
      (err) {
        showSnackBar(err.message);
        emit(MyConnectionsInitial());
      },
      (res) async {
        listOfConnectionData.clear();
        listOfConnectionData.addAll(res.data!);
        emit(GetConnectionListLoaded());
      },
    );
  }

  Future addNewConnection() async {
    if (formKey.currentState!.validate() == true) {
      emit(AddNewConnectionLoading());
      final res = await addNewConnectionUseCase.execute(
        nameController.text,
        emailController.text,
        titleController.text,
        phoneController.text,
        contentController.text,
      );
      res.fold(
        (err) {
          showSnackBar(err.message);
        },
        (res) async {
          emit(MyConnectionsInitial());
          MagicRouter.pop();
        },
      );
    }
  }

  Future favouriteStatus(int connectionId, int status) async {
    emit(FavouriteStatusLoading());
    final res = await favouriteStatusUseCase.execute(connectionId, status);
    res.fold(
      (err) {
        showSnackBar(err.message);
        emit(MyConnectionsInitial());
      },
      (res) async {
        listOfFavouriteData.clear();
        emit(FavouriteStatusLoaded());
        getFavouriteList();
        MagicRouter.pop();
        showSnackBar(res.message!);
      },
    );
  }

  Future getFavouriteList() async {
    emit(GetFavouriteListLoading());
    final res = await getFavouriteListUseCase.execute();
    res.fold(
      (err) {
        showSnackBar(err.message);
        emit(MyConnectionsInitial());
      },
      (res) async {
        listOfFavouriteData.clear();
        listOfFavouriteData.addAll(res.data!);
        emit(GetFavouriteListLoaded());
      },
    );
  }
}
