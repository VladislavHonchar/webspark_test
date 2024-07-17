import 'package:flutter/material.dart';
import 'package:webspark_test/config/entity/display_result.dart';
import 'package:webspark_test/ui/navigation/main_navigation.dart';

class ResultScreenModel{

  final List<DisplayResult> results;

  ResultScreenModel({required this.results});

  void viewResult (BuildContext context, DisplayResult result) {
    Navigator.of(context).pushNamed(NavigationRouteName.prewiewScreen, arguments: result);
  }
}