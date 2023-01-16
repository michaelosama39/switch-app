import 'package:equatable/equatable.dart';

class ErrorMessageModel extends Equatable {
  final String message;
  final bool status;

  const ErrorMessageModel({
    required this.message,
    required this.status,
  });

  factory ErrorMessageModel.fromJson(Map<String, dynamic> json) {
    return ErrorMessageModel(
      message: json["message"],
      status: json["status"],
    );
  }

  @override
  List<Object?> get props => [
    message,
    status,
  ];
}