import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:webspark_test/config/entity/data.dart';
import 'package:webspark_test/config/entity/data_for_post.dart';
class ApiData{

  final dio = Dio();

  Future<DataForCalculate?> getData ({required String path}) async {
    try{

    final json = await dio.get(path);
    final jsonMap = json.data as Map<String, dynamic>;
    final response = DataForCalculate.fromJson(jsonMap);
    print(json);
    return response;
    }catch(e){
      return null;
    }
  }

  Future<void> postData ({required String path, required List<Result> results}) async {
    final data = jsonEncode(results.map((el) => el.toJson()).toList());
    print(data);
    try{
      final response = await dio.post(
        path,
        

        data: data
      );
      print(response);
    }catch(e){
      print(e);
    }
  }
}