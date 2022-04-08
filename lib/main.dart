import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:stripe_app/blocs/blocs.dart';
import 'package:stripe_app/enums/enums.dart';
import 'package:stripe_app/routes/routes.dart';

void main() {
  runApp(MultiBlocProvider(providers: [
    BlocProvider(
      create: (_) => PaymentBloc(),
    )
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stripe APP',
      debugShowCheckedModeBanner: false,
      routes: routes,
      initialRoute: ROUTES.homePage.name,
      theme: ThemeData.light().copyWith(
          appBarTheme: const AppBarTheme(backgroundColor: Color(0xff284879)),
          primaryColor: const Color(0xff284879),
          scaffoldBackgroundColor: const Color(0xff21232A)),
    );
  }
}
