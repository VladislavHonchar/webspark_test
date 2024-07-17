import 'package:json_annotation/json_annotation.dart';

part 'data_for_post.g.dart';

@JsonSerializable()
class Result {
  final String id;
  final ResultData result;

  Result({
    required this.id, 
    required this.result
    });

    factory Result.fromJson(Map<String, dynamic> json) => _$ResultFromJson(json);

    Map<String, dynamic> toJson() => _$ResultToJson(this);
}

@JsonSerializable()
class ResultData{
  final List<Step> steps;
  final String path;

  ResultData({
    required this.steps, 
    required this.path
    });

    factory ResultData.fromJson(Map<String, dynamic> json) => _$ResultDataFromJson(json);

    Map<String, dynamic> toJson() => _$ResultDataToJson(this);
}


@JsonSerializable()
class Step{
  final String x;
  final String y;

  Step({
    required this.x, 
    required this.y
    });

    factory Step.fromJson(Map<String, dynamic> json) => _$StepFromJson(json);

    Map<String, dynamic> toJson() => _$StepToJson(this);
}