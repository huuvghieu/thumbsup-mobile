import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app/data/repositories/geolocation_repository.dart';
import 'package:my_app/data/repositories/place_repository.dart';
import 'package:my_app/logic/blocs/geolocation/geolocation_bloc.dart';
import 'package:my_app/logic/blocs/place/place_bloc.dart';
import 'package:my_app/screens/payment/components/body_set_location.dart';

class SetLocationScreem extends StatelessWidget {
  static const String routeName = '/set-location-screen';
  const SetLocationScreem({super.key});

  static Route route() {
    return MaterialPageRoute(
      builder: (_) => const SetLocationScreem(),
      settings: const RouteSettings(name: routeName),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        body: MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => GeolocationBloc(
                geolocationRepository:
                    RepositoryProvider.of<GeolocationRepository>(context),
                placesRepository:
                    RepositoryProvider.of<PlacesRepository>(context),
              )..add(LoadMap()),
            ),
            BlocProvider(
                create: (context) => PlaceBloc(
                    placesRepository:
                        RepositoryProvider.of<PlacesRepository>(context))),
          ],
          child: const BodySetLocation(),
        ),
      ),
    );
  }
}
