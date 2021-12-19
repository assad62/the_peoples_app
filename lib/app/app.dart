import 'package:flutter/material.dart';
import 'package:flutter_starter_app/common/navigation_service.dart';
import 'package:flutter_starter_app/ui/router.dart';
import 'package:flutter_starter_app/ui/views/home_view.dart';
import 'package:google_fonts/google_fonts.dart';
import '../locator.dart';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: locator<NavigationService>().navigatorKey,
      title: 'Flutter Demo',
      initialRoute: AppRoutes.homeRoute,
      onGenerateRoute: AppRouter.generateRoute,
      theme: ThemeData(
        textTheme: GoogleFonts.latoTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      home: HomeView(),
    );
  }
}