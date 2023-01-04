import 'package:equatable/equatable.dart';

class ErrorMessageModel extends Equatable {
  final String message;
  final String status;

  const ErrorMessageModel({
    required this.message,
    required this.status,
  });

  factory ErrorMessageModel.fromJson(Map<String, dynamic> json) {
    return ErrorMessageModel(
      message: json["error"],
      status: json["status"],
    );
  }

  @override
  List<Object?> get props => [
    message,
    status,
  ];
}