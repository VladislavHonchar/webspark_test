import 'package:flutter/material.dart';
import 'package:webspark_test/ui/navigation/main_navigation.dart';

class HomePageModel{
  String urlAdress = '';

  void goToNextScreen ( BuildContext context) {
    Navigator.of(context)
    .pushNamed(
      NavigationRouteName.processScreen, 
      arguments: urlAdress
      );
  }
}