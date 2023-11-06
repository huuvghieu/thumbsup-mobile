import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:my_app/config/app_router.dart';
import 'package:my_app/data/models/product_model.dart';
import 'package:my_app/data/repositories/brand_repository.dart';
import 'package:my_app/data/repositories/category_repository.dart';
import 'package:my_app/data/repositories/city_repository.dart';
import 'package:my_app/data/repositories/customer_repository.dart';
import 'package:my_app/data/repositories/geolocation_repository.dart';
import 'package:my_app/data/repositories/local_storage_repository.dart';
import 'package:my_app/data/repositories/order_repository.dart';
import 'package:my_app/data/repositories/product_repository.dart';
import 'package:my_app/data/repositories/state_repository.dart';
import 'package:my_app/logic/blocs/cart/cart_bloc.dart';
import 'package:my_app/logic/blocs/category/category_bloc.dart';
import 'package:my_app/logic/blocs/city/city_bloc.dart';
import 'package:my_app/logic/blocs/filters/filters_bloc.dart';
import 'package:my_app/logic/blocs/state/state_bloc.dart';
import 'package:my_app/logic/cubits/google_auth/cubit/google_auth_cubit.dart';
import 'package:my_app/screens/welcome/splash.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await Hive.initFlutter();
  Hive.registerAdapter(ProductModelAdapter());
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<GeolocationRepository>(
          create: (_) => GeolocationRepository(),
        ),
        RepositoryProvider<CustomerRepository>(
          create: (_) => CustomerRepository(),
        ),
        RepositoryProvider<ProductRepository>(
          create: (_) => ProductRepository(),
        ),
        RepositoryProvider<CategoryRepository>(
          create: (_) => CategoryRepository(),
        ),
        RepositoryProvider<BrandRepository>(
          create: (_) => BrandRepository(),
        ),
        RepositoryProvider<CityRepository>(
          create: (_) => CityRepository(),
        ),
        RepositoryProvider<OrderRepository>(
          create: (_) => OrderRepository(),
        ),
        RepositoryProvider<StateRepository>(
          create: (_) => StateRepository(),
        ),
        RepositoryProvider<LocalStorageRepository>(
          create: (_) => LocalStorageRepository(),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => GoogleAuthCubit(),
          ),
          // BlocProvider(
          //   create: (context) =>
          //       CustomerBloc(customerRepository: context.read<CustomerRepository>())
          //       ..add(CustomerEvent)
          // ),
          // BlocProvider(
          //   create: (context) => CartBloc(),
          // )
          // BlocProvider(
          //   create: (context) =>
          //       GeolocationBloc(geolocationRepository: context.read<GeolocationRepository>())
          //         ..add(LoadGeolocation()),
          // ),
          BlocProvider(
            create: (context) =>
                CartBloc(localStorageRepository: LocalStorageRepository())
                  ..add(LoadCartEvent()),
          ),
          BlocProvider(
            create: (context) =>
                CategoryBloc(context.read<CategoryRepository>())
                  ..add(const LoadCategoryEvent()),
          ),
          BlocProvider(
            create: (context) => StateBloc(context.read<StateRepository>())
              ..add(const LoadStateEvent()),
          ),

          BlocProvider(
            create: (context) => FiltersBloc(
                categoryRepository: context.read<CategoryRepository>(),
                brandRepository: context.read<BrandRepository>(),
                productRepository: context.read<ProductRepository>())
              ..add(FilterLoad()),
          ),

          BlocProvider(
              create: (context) => CityBloc(context.read<CityRepository>())
                ..add(const LoadCityEvent())),
          // BlocProvider(
          //   create: (context) => CheckoutBloc(cartBloc: context.read<CartBloc>(),
          //   orderRepository: context.read<OrderRepository>()),
          // )
        ],
        child: MaterialApp(
            title: "Thumbsup",
            theme: ThemeData(fontFamily: "Sofia Pro"),
            debugShowCheckedModeBanner: false,
            onGenerateRoute: AppRouter.onGenerateRoute,
            home: StreamBuilder<User?>(
              stream: FirebaseAuth.instance.authStateChanges(),
              builder: (context, AsyncSnapshot<User?> snapshot) {
                return const Scaffold(
                  backgroundColor: Colors.white,
                  body: Splash(),
                );
              },
            )),
      ),
    );
  }
}

// class App extends StatelessWidget {
//   const App({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: AppConfig.appName,
//       home: Dashboard(title: AppConfig.appName, version: AppConfig.version,),
//       debugShowCheckedModeBanner: false,
//     );
//   }
// }
