import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:webspark_test/ui/widgets/preview_screen/preview_screen_model.dart';

class PreviewScreen extends StatelessWidget {
  const PreviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final displayResult = context.read<PreviewScreenModel>().displayResult;
    if(displayResult != null){

    return Scaffold(
      appBar: AppBar(
        title: const Text('Result Detail'),
      ),
      body: Column(
        children: [
          Text(
            displayResult.result.path,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: displayResult.field[0].length,
              ),
              itemBuilder: (context, index) {
                final row = index % displayResult.field[0].length;
                final col = index ~/ displayResult.field[0].length;
                final cell = displayResult.field[col][row];
                final isStart = row.toString() == displayResult.result.steps.first.y && col.toString() == displayResult.result.steps.first.x;
                final isEnd = row.toString() == displayResult.result.steps.last.x && col.toString() == displayResult.result.steps.last.y;
                final isPath = displayResult.result.steps.any((step) => step.y == col.toString() && step.x == row.toString());

                Color color;
                if (isStart) {
                  color = const Color(0xFF64FFDA);
                } else if (isEnd) {
                  color = const Color(0xFF009688);
                } else if (cell == 'X') {
                  color = const Color(0xFF000000);
                } else if (isPath) {
                  color = const Color(0xFF4CAF50);
                } else {
                  color = const Color(0xFFFFFFFF);
                }

                return Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    color: color,
                  ),
                  child: Center(child: Text('($row, $col)')),
                );
              },
              itemCount: displayResult.field.length * displayResult.field[0].length,
            ),
          ),
        ],
      ),
    );
    }else{
      return const Scaffold(
        body: Text("Дані не завантажилися"),
      );
    }
  }
}