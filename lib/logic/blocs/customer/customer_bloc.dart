import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:my_app/data/models/order_model.dart';
import 'package:my_app/data/repositories/customer_repository.dart';

part 'customer_event.dart';
part 'customer_state.dart';

class CustomerBloc extends Bloc<CustomerEvent, CustomerState> {
  final CustomerRepository customerRepository;
  CustomerBloc({required this.customerRepository})
      : super(CustomerLoadingState()) {
    on<StartRegisterEvent>(_onStartRegister);
    on<RegisterEvent>(_onRegisterCustomer);
    on<LoadOrderByCustomerIdEvent>(_onLoadOrderByCustomerId);
  }

  void _onStartRegister(StartRegisterEvent event, Emitter<CustomerState> emit){
    emit(CustomerRegistering());
  }

  Future<void> _onRegisterCustomer(
      RegisterEvent event, Emitter<CustomerState> emit) async {
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
        address: event.address,
        avatar: event.avatar,
      );
      emit(CustomerRegistered());
    } catch (e) {
      emit(CustomerError(e.toString()));
    }
  }

  Future<void> _onLoadOrderByCustomerId(
      LoadOrderByCustomerIdEvent event, Emitter<CustomerState> emit) async {
    emit(CustomerLoadingState());
    try {
      final orderList =
          await customerRepository.getOrderListByCustomerId(event.id);
      emit(OrderByCustoerIdLoadedState(orderList!));
    } catch (e) {
      emit(CustomerError(e.toString()));
    }
  }
}
