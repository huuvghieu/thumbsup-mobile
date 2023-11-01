part of 'customer_bloc.dart';

@immutable
abstract class CustomerState extends Equatable {
  const CustomerState();
}

class CustomerLoadingState extends CustomerState {
  @override
  List<Object> get props => [];
}

class OrderByCustoerIdLoadedState extends CustomerState {
  const OrderByCustoerIdLoadedState(this.orderModelList);
  final List<OrderModel> orderModelList;

  @override
  List<Object> get props => [orderModelList];
}

class CustomerRegistering extends CustomerState {
  @override
  List<Object?> get props => [];
}

class CustomerRegistered extends CustomerState {
  @override
  List<Object?> get props => [];
}

class CustomerError extends CustomerState {
  String message;
  CustomerError(this.message);
  @override
  List<Object?> get props => [message];
}
