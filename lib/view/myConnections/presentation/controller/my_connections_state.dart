part of 'my_connections_cubit.dart';

@immutable
abstract class MyConnectionsState {}

class MyConnectionsInitial extends MyConnectionsState {}
class ChangeTabButtonState extends MyConnectionsState {}
class ExchangeStatusLoading extends MyConnectionsState {}
class FavouriteStatusLoading extends MyConnectionsState {}
class ExchangeStatusLoaded extends MyConnectionsState {}
class FavouriteStatusLoaded extends MyConnectionsState {}
class GetExchangeListLoading extends MyConnectionsState {}
class GetExchangeListLoaded extends MyConnectionsState {}
class GetConnectionListLoading extends MyConnectionsState {}
class GetConnectionListLoaded extends MyConnectionsState {}
class GetFavouriteListLoading extends MyConnectionsState {}
class GetFavouriteListLoaded extends MyConnectionsState {}
class AddNewConnectionLoading extends MyConnectionsState {}
class DeleteConnectionLoaded extends MyConnectionsState {}
class SearchStateLoaded extends MyConnectionsState {}
