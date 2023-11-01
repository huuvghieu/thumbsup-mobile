import 'dart:typed_data';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:my_app/data/models/order_model.dart';
import 'package:my_app/data/repositories/customer_repository.dart';
import 'package:my_app/logic/blocs/store/store_bloc.dart';
import 'package:my_app/screens/login/register.dart';

part 'customer_event.dart';
part 'customer_state.dart';

class CustomerBloc extends Bloc<CustomerEvent, CustomerState> {
  final CustomerRepository customerRepository;
  int? id;

  CustomerBloc({required this.customerRepository, this.id})
      : super(CustomerLoadingState()) {
    on<RegisterEvent>(_onRegisterCustomer);
    on<LoadOrderByCustomerIdEvent>(_onLoadOrderByCustomerId);
  }

  Future<void> _onRegisterCustomer(
      RegisterEvent event, Emitter<CustomerState> emit) async {
    emit(CustomerRegistering());
    await Future.delayed(const Duration(seconds: 1));
    try {
      await customerRepository.registerCustomer(
          userName: event.userName,
          passWord: event.passWord,
          passWordConfirmed: event.passWordConfirmed,
          fullName: event.fullName,
          email: event.email,
          phone: event.phone,
          dob: event.dob,
          cityId: event.cityId,
          selectedFile: event.selectedFile,
          bytesData: event.bytesData!,
          filename: event.filename!);
      emit(CustomerRegistered());
    } catch (e) {
      emit(CustomerError(e.toString()));
    }
  }

  Future<void> _onLoadOrderByCustomerId(
      LoadOrderByCustomerIdEvent event, Emitter<CustomerState> emit) async {
    emit(CustomerLoadingState());
    try {
      final orderList = await customerRepository.getOrderListByCustomerId(id!);
      emit(OrderByCustoerIdLoadedState(orderList!));
    } catch (e) {
      emit(CustomerError(e.toString()));
    }
  }
}
