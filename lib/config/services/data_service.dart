import 'package:webspark_test/config/api/api.dart';
import 'package:webspark_test/config/entity/data.dart';
import 'package:webspark_test/config/entity/data_for_post.dart';
import 'package:webspark_test/config/entity/display_result.dart';
import 'package:webspark_test/config/services/shortest_path_finder.dart';

class Params {
  final List<List<String>> field;
  final Point start;
  final Point end;
  final int rows;
  final int cols;

  Params(this.field, this.start, this.end, this.rows, this.cols);
}

class DataService{

  final _api = ApiData();

  Future<List<DisplayResult>> fetchAndCalculateData (String path, Function(double) onProgress) async{
    final data = await _api.getData(path: path);
    onProgress(0.5);
    final result = await prepaireDataForCalculate(data, onProgress);
    return result;
  }

  Future<List<DisplayResult>> prepaireDataForCalculate (DataForCalculate? data, Function(double) onProgress) async{
    List<DisplayResult> results = [];


    for (var i = 0; i < data!.data.length; i++) {
      final item = data.data[i];

      final int rows = item.field.length;
      final int cols = item.field[0].length;

      final field = createField(item.field);
      final Point start = Point(item.start['x'], item.start['y']);
      final Point end = Point(item.end['x'], item.end['y']);
      
      final shortestPath = await findShortestPath(Params(field, start, end, rows, cols));
      onProgress(0.5 + 0.5 * (i + 1) / data.data.length); // Прогрес після кожного обчислення
      final result = createResult(item.id, shortestPath, start, end);
      
       results.add(DisplayResult(
      id: item.id,
      result: result.result,
      field: field,
    ));
      
    }
    return results;
  }


List<List<String>> createField(List<String> rawField){
  List<List<String>> field = [];
      for (var row in rawField) {
        field.add(row.split(''));
      }
      return field;
}

// Future<List<Point>> claculateShortestPath(List<List<String>> field, Point start, Point end, int rows, int cols) async{
//   return await 
// }

Result createResult(String id, List<Point> shortestPath, Point start, Point end){
  List<Step> steps = [Step(x: start.x.toString(), y: start.y.toString()), Step(x: end.x.toString(), y: end.y.toString())];
  return Result(
    id: id, 
    result: ResultData(
      steps: steps, 
      path: formatPath(shortestPath),
    )
  );
}


Future<List<Point>> findShortestPath(Params params) async {
  return shortestPathAlgoritm(params.field, params.start, params.end, params.rows, params.cols);
}

Future<void> postData(String path, List<Result> results) async {
  await _api.postData(path: path, results: results);
}
}