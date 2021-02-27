import 'package:equatable/equatable.dart';

class AppError extends Equatable {
  final AppErrorType appErrorType;

  const AppError(this.appErrorType);

  @override
  // TODO: implement props
  List<Object> get props => [appErrorType];
}

enum AppErrorType { api, network, database }
