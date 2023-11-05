import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:my_app/common/color.dart';
import 'package:my_app/common/string.dart';
import 'package:my_app/data/repositories/order_repository.dart';
import 'package:my_app/data/repositories/place_repository.dart';
import 'package:my_app/logic/blocs/autocomplete/autocomplete_bloc.dart';
import 'package:my_app/logic/blocs/cart/cart_bloc.dart';
import 'package:my_app/logic/blocs/checkout/checkout_bloc.dart';
import 'package:my_app/logic/blocs/geolocation/geolocation_bloc.dart';
import 'package:my_app/screens/payment/screens/checkout_screen.dart';
import 'package:my_app/screens/widget/decorate_top.dart';

class BodySetLocation extends StatelessWidget {
  const BodySetLocation({super.key});
  @override
  Widget build(BuildContext context) {
    double baseWidth = 375;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          const DecorateTop(),
          Padding(
              padding: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0 * fem, 20 * fem),
              child: Text(
                'Tìm vị trí',
                style: TextStyle(
                  fontFamily: 'Solway',
                  fontSize: 25 * ffem,
                  color: Colors.black,
                ),
              )),
          BlocProvider(
            create: (context) => AutocompleteBloc(
                placesRepository:
                    RepositoryProvider.of<PlacesRepository>(context))
              ..add(const LoadAutocomplete()),
            child: SearchBoxLocation(
              fem: fem,
            ),
          ),
          Center(
            child: Container(
                margin:
                    EdgeInsets.fromLTRB(30 * fem, 0 * fem, 30 * fem, 0 * fem),
                width: double.infinity,
                height: 350 * fem,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10 * fem),
                    border: Border.all(
                        color: const Color.fromARGB(255, 206, 206, 206))),
                child: BlocBuilder<GeolocationBloc, GeolocationState>(
                  builder: (context, state) {
                    if (state is LocationLoading) {
                      return const Center(
                        child: CircularProgressIndicator(
                          color: AppColor.primary,
                        ),
                      );
                    }
                    if (state is LocationLoaded) {
                      Set<Marker> markers = {};
                      Marker maker = Marker(
                        markerId: MarkerId('1'),
                        infoWindow: InfoWindow(
                          title: 'You are here',
                        ),
                        position: LatLng(
                          state.place.lat,
                          state.place.lon,
                        ),
                      );
                      markers.add(maker);
                      return GoogleMap(
                        myLocationButtonEnabled: true,
                        buildingsEnabled: false,
                        markers: markers,
                        onMapCreated: (GoogleMapController controller) {
                          context.read<GeolocationBloc>().add(
                                LoadMap(controller: controller),
                              );
                        },
                        initialCameraPosition: CameraPosition(
                            target: LatLng(
                              state.place.lat,
                              state.place.lon,
                            ),
                            zoom: 15 * fem),
                      );
                    }
                    return GoogleMap(
                      myLocationButtonEnabled: true,
                      buildingsEnabled: false,
                      onMapCreated: (GoogleMapController controller) {
                        context.read<GeolocationBloc>().add(
                              LoadMap(controller: controller),
                            );
                      },
                      initialCameraPosition: CameraPosition(
                          target: const LatLng(
                            10,
                            10,
                          ),
                          zoom: 15 * fem),
                    );
                  },
                )),
          ),
          BlocProvider(
            create: (context) => AutocompleteBloc(
                placesRepository:
                    RepositoryProvider.of<PlacesRepository>(context))
              ..add(const LoadAutocomplete()),
            child: _SearchBoxSuggestions(),
          ),
          Center(
            child: Container(
              margin:
                  EdgeInsets.fromLTRB(30 * fem, 50 * fem, 30 * fem, 0 * fem),
              width: 250 * fem,
              height: 60 * fem,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10 * fem),
                  border: Border.all(
                      color: const Color.fromARGB(255, 206, 206, 206))),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => BlocProvider(
                                create: (context) => CheckoutBloc(
                                    cartBloc: context.read<CartBloc>(),
                                    orderRepository:
                                        context.read<OrderRepository>()),
                                child: CheckoutScreen(
                                  id: AppString.customerId,
                                ),
                              )));
                },
                style: ButtonStyle(
                    shape: MaterialStateProperty.resolveWith<
                        RoundedRectangleBorder?>((Set<MaterialState> states) {
                      if (states.contains(MaterialState.focused)) {
                        return RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5 * fem),
                            side: const BorderSide(
                              color: AppColor.primary,
                            ));
                      }
                      return RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5 * fem),
                          side: const BorderSide(
                            color: Colors.white,
                          ));
                    }),
                    backgroundColor:
                        MaterialStateProperty.all<Color?>(AppColor.primary)),
                child: const Text(
                  'THIẾT LẬP ĐỊA ĐIỂM',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SearchBoxLocation extends StatelessWidget {
  const SearchBoxLocation({
    super.key,
    required this.fem,
  });

  final double fem;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(left: 20 * fem, right: 20 * fem, bottom: 20 * fem),
      child: TextField(
        decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            hintText: 'Tìm vị trí của bạn',
            prefixIcon: Icon(Icons.search),
            contentPadding: EdgeInsets.only(
                left: 20 * fem, bottom: 5 * fem, right: 5 * fem),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30 * fem),
              borderSide:
                  const BorderSide(color: Color.fromARGB(255, 197, 197, 197)),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30 * fem),
              borderSide:
                  const BorderSide(color: Color.fromARGB(255, 197, 197, 197)),
            )),
        onChanged: (value) {
          context
              .read<AutocompleteBloc>()
              .add(LoadAutocomplete(searchInput: value));
        },
      ),
    );
  }
}

class _SearchBoxSuggestions extends StatelessWidget {
  const _SearchBoxSuggestions({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AutocompleteBloc, AutocompleteState>(
      builder: (context, state) {
        if (state is AutocompleteLoading) {
          return SizedBox();
        }
        if (state is AutocompleteLoaded) {
          return ListView.builder(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            itemCount: state.autocomplete.length,
            itemBuilder: (context, index) {
              return Container(
                color: Colors.black.withOpacity(0.6),
                child: ListTile(
                  title: Text(
                    state.autocomplete[index].description,
                    style: Theme.of(context)
                        .textTheme
                        .headline6!
                        .copyWith(color: Colors.white),
                  ),
                  onTap: () {
                    context.read<GeolocationBloc>().add(
                          SearchLocation(
                            placeId: state.autocomplete[index].placeId,
                          ),
                        );
                    context.read<AutocompleteBloc>().add(ClearAutocomplete());
                  },
                ),
              );
            },
          );
        } else {
          return Text('Something went wrong!');
        }
      },
    );
  }
}
