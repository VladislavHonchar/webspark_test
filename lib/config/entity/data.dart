
import 'package:json_annotation/json_annotation.dart';

part 'data.g.dart';

@JsonSerializable()
class DataForCalculate {
  final bool error;
  final String message;
  final List<Data> data;

  DataForCalculate({
    required this.error, 
    required this.message, 
    required this.data
    }); 

    factory DataForCalculate.fromJson(Map<String, dynamic> json) => _$DataForCalculateFromJson(json);

    Map<String, dynamic> toJson() => _$DataForCalculateToJson(this);
}



@JsonSerializable()
class Data{
  final String id;
  final List<String> field;
  final Map<String, dynamic> start;
  final Map<String, dynamic> end;

  Data({
    required this.id, 
    required this.field, 
    required this.start, 
    required this.end
    });

    factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

    Map<String, dynamic> toJson() => _$DataToJson(this);
}