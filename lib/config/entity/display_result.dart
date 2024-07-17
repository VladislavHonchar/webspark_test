import 'package:webspark_test/config/entity/data_for_post.dart';

class DisplayResult {
  final String id;
  final ResultData result;
  final List<List<String>> field;

  DisplayResult({
    required this.id,
    required this.result,
    required this.field,
  });
}