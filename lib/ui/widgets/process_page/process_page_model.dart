import 'package:flutter/material.dart';
import 'package:webspark_test/config/entity/data_for_post.dart';
import 'package:webspark_test/config/entity/display_result.dart';
import 'package:webspark_test/config/services/data_service.dart';
import 'package:webspark_test/ui/navigation/main_navigation.dart';

class ProcessPageModel extends ChangeNotifier{
  final String urlAdress;
  final _getDataService = DataService();
  
  bool _isLoading = true;
  bool get isLoading => _isLoading;
  
  double _progress = 0.0;
  double get progress => _progress;

  List<DisplayResult> _results = [];
  List<DisplayResult> get results => _results;
  

  ProcessPageModel({required this.urlAdress});

  Future<void> getData () async {
    _results = (await _getDataService.fetchAndCalculateData(urlAdress, (progress) {
      _progress = progress;
    notifyListeners();
    }));
    _isLoading = false;
    notifyListeners();
  }
  
  Future<void> postData (BuildContext context) async{
    final resultsToSend = _results.map((result) => Result(
      id: result.id,
      result: result.result,
    )).toList();
    await _getDataService.postData(urlAdress, resultsToSend);
    if(context.mounted){
    Navigator.of(context).pushNamedAndRemoveUntil(NavigationRouteName.resultScreen, ModalRoute.withName('/'), arguments: _results);
    }
  }
}