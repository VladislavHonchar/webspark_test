import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:webspark_test/config/entity/display_result.dart';
import 'package:webspark_test/ui/widgets/home_page/home_page.dart';
import 'package:webspark_test/ui/widgets/home_page/home_page_model.dart';
import 'package:webspark_test/ui/widgets/preview_screen/preview_screen.dart';
import 'package:webspark_test/ui/widgets/preview_screen/preview_screen_model.dart';
import 'package:webspark_test/ui/widgets/process_page/process_page.dart';
import 'package:webspark_test/ui/widgets/process_page/process_page_model.dart';
import 'package:webspark_test/ui/widgets/result_list_screen.dart/result_list_screen.dart';
import 'package:webspark_test/ui/widgets/result_list_screen.dart/result_screen_model.dart';

class ScreenFactory {
  Widget homePage(){
    return Provider(
      create: (_) => HomePageModel(),
      child: const HomePage(),
      );
  }
  Widget processPage(String urlAdress){
    return ChangeNotifierProvider(
      create: (_) => ProcessPageModel(urlAdress: urlAdress),
      child: const ProcessPage(),
      );
  }
  Widget resultListScreen(List<DisplayResult> results){
    return Provider(
      create: (_) => ResultScreenModel(results: results),
      child: const ResultListScreen(),
      );
  }
  Widget previewScreen(DisplayResult? displayResult){
    return Provider(
      create: (_) => PreviewScreenModel(displayResult: displayResult),
      child: const PreviewScreen(),
      );
  }
}