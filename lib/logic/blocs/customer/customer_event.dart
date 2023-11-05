part of 'customer_bloc.dart';

@immutable
abstract class CustomerEvent extends Equatable {
  const CustomerEvent();
}

class StartRegisterEvent extends CustomerEvent{
  @override
  List<Object?> get props => [];
}

class RegisterEvent extends CustomerEvent {
  final String userName;
  final String passWord;
  final String passWordConfirmed;
  final String fullName;
  final String email;
  final String phone;
  final String dob;
  final String address;
  final int cityId;
  final File avatar;

  const RegisterEvent({
    required this.userName,
    required this.passWord,
    required this.passWordConfirmed,
    required this.fullName,
    required this.email,
    required this.phone,
    required this.dob,
    required this.address,
    required this.cityId,
    required this.avatar,
  });

  @override
  List<Object?> get props => [
        userName,
        passWord,
        passWordConfirmed,
        fullName,
        email,
        phone,
        dob,
        cityId,
        avatar,
      ];
}

class LoadOrderByCustomerIdEvent extends CustomerEvent {
  final int id;
  const LoadOrderByCustomerIdEvent({required this.id});

  @override
  List<Object?> get props => [];
}
