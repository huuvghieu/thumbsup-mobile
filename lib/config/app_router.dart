import 'package:flutter/material.dart';
import 'package:my_app/screens/payment/screens/confirmed_payment_screen.dart';
import 'package:my_app/screens/payment/screens/method_payment_screen.dart';
import 'package:my_app/screens/payment/screens/set_location_screen.dart';
import 'package:my_app/screens/product/product_list_screen.dart';
import 'package:my_app/screens/product/product_list_search_screen.dart';

class AppRouter {
  static Route onGenerateRoute(RouteSettings settings) {
    print('Route: ${settings.name}');
    switch (settings.name) {
      case ProductListScreen.routeName:
        List<dynamic> args = settings.arguments as List<dynamic>;
        return ProductListScreen.route(
          categories: args[0],
          brands: args[1],
          priceStart: args[2],
          priceEnd: args[3],
        );

      case ProductListSearchScreen.routeName:
        return ProductListSearchScreen.route(
          searchString: settings.arguments as String,
        );
      case MethodPaymentScreen.routeName:
        return MethodPaymentScreen.route();

      case ConfirmedPaymentScreen.routeName:
        return ConfirmedPaymentScreen.route();

      case SetLocationScreem.routeName:
        return SetLocationScreem.route();
      default:
        return _errorRoute();
    }
  }

  static Route _errorRoute() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: '/error'),
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
        body: const Center(
          child: Text('Something went wrong!'),
        ),
      ),
    );
  }
}
