import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app/data/models/city_model.dart';
import 'package:my_app/logic/blocs/city/city_bloc.dart';

class DropDownTextFieldCustom extends StatefulWidget {
  final TextEditingController controller;
  DropDownTextFieldCustom({super.key, required this.controller});

  @override
  State<DropDownTextFieldCustom> createState() =>
      _DropDownTextFieldCustomState();
}

class _DropDownTextFieldCustomState extends State<DropDownTextFieldCustom> {
  List<CityModel> cities = List.empty();

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Container(
          width: 400,
          child: BlocBuilder<CityBloc, CityState>(
            builder: (context, state) {
              if (state is CityLoadingState) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (state is CityLoadedState) {
                cities = state.cityModels.toList();
                return DropdownButtonFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Thành phố',
                    icon: Icon(Icons.location_city),
                  ),
                  hint: const Text('Chọn thành phố'),
                  value: cities[0].id,
                  onChanged: (newValue) {
                    setState(() {
                      widget.controller.text = newValue.toString();
                    });
                  },
                  items: cities.map((c) {
                    return DropdownMenuItem(
                      child: Text(c.cityName.toString()),
                      value: c.id,
                    );
                  }).toList(),
                );
              }
              return Container();
            },
          )),
    );
  }
}
