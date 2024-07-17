import 'package:flutter/material.dart';
import 'package:webspark_test/ui/navigation/main_navigation.dart';



class MyApp extends StatelessWidget {
  static final mainNavigation = MainNavigation();
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(backgroundColor: Colors.blue,),
        buttonTheme: const ButtonThemeData(buttonColor: Colors.blue, ),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routes: mainNavigation.routes,
      initialRoute: NavigationRouteName.homePage,
      onGenerateRoute: mainNavigation.onGenerateRoute,
    );
  }
}