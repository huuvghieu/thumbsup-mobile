part of 'customer_bloc.dart';

@immutable
abstract class CustomerEvent extends Equatable {
  const CustomerEvent();
}

class RegisterEvent extends CustomerEvent {
  final String userName;
  final String passWord;
  final String passWordConfirmed;
  final String fullName;
  final String email;
  final String phone;
  final String dob;
  final int cityId;
  final List<int> selectedFile;
  Uint8List? bytesData;
  String? filename;

  RegisterEvent({
    required this.userName,
    required this.passWord,
    required this.passWordConfirmed,
    required this.fullName,
    required this.email,
    required this.phone,
    required this.dob,
    required this.cityId,
    required this.selectedFile,
    this.bytesData,
    this.filename,
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
        selectedFile,
        bytesData,
        filename
      ];
}

class LoadOrderByCustomerIdEvent extends CustomerEvent {
  const LoadOrderByCustomerIdEvent();

  @override
  List<Object?> get props => [];
}
