import 'package:flutter/material.dart';
import 'package:webspark_test/config/entity/display_result.dart';
import 'package:webspark_test/factories/screen_factory.dart';

abstract class NavigationRouteName {
  static const homePage = '/';
  static const processScreen = '/process_screen';
  static const resultScreen = '/result_screen';
  static const prewiewScreen = '/result_screen/preview_screen';
}

class MainNavigation {
  static final _screenFactory = ScreenFactory();
  final routes = <String, Widget Function(BuildContext)> {
    NavigationRouteName.homePage: (_) => _screenFactory.homePage(),
  };
  Route<Object> onGenerateRoute(RouteSettings settings){
    switch(settings.name) {
      case NavigationRouteName.processScreen:
      final arguments = settings.arguments;
      final urlAdress = arguments is String ? arguments : '';
      return MaterialPageRoute(
        builder: (_) => _screenFactory.processPage(urlAdress)
      );
      case NavigationRouteName.resultScreen:
      final arguments = settings.arguments;
      final results = arguments is List<DisplayResult> ? arguments : <DisplayResult>[];
      return MaterialPageRoute(
        builder: (_) => _screenFactory.resultListScreen(results)
      );
      case NavigationRouteName.prewiewScreen:
      final arguments = settings.arguments;
      final displayResult = arguments is DisplayResult ? arguments : null;
      return MaterialPageRoute(
        builder: (_) => _screenFactory.previewScreen(displayResult)
      );
      default:
      const widget = Text('Navigation error!!!!!');
      return MaterialPageRoute(builder: (_) => widget);
    }
  }
}