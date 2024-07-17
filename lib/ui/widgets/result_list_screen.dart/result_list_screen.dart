import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:webspark_test/ui/widgets/result_list_screen.dart/result_screen_model.dart';

class ResultListScreen extends StatelessWidget {
  const ResultListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final model = context.read<ResultScreenModel>();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Result list screen"),
      ),
      body: ListView.separated(
        separatorBuilder: (context, index) => const Divider(), 
        itemCount: model.results.length,

        itemBuilder: (context, index){
          final result = model.results[index];
          return ListTile(
            title: Text(result.result.path,
            textAlign: TextAlign.center,),
            onTap: () => model.viewResult(context, result),
          );
        }, 
        )
    );
  }
}