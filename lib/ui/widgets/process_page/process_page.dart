import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:webspark_test/ui/widgets/process_page/process_page_model.dart';

class ProcessPage extends StatefulWidget {
  const ProcessPage({super.key});

  @override
  State<ProcessPage> createState() => _ProcessPageState();
}

class _ProcessPageState extends State<ProcessPage> {
  @override
  void initState() {
    super.initState();
    final model = context.read<ProcessPageModel>();
    model.getData();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Process Screen"),
      ),
      body: const _ProcessPageBodyWidget(),
    );
  }
}

class _ProcessPageBodyWidget extends StatelessWidget {
  const _ProcessPageBodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final model = context.watch<ProcessPageModel>();
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          model.isLoading ? const Text("Please, wait") : const Text(textAlign:TextAlign.center  ,
          "All calculations has finished, you can send your results to server"),
          const SizedBox(height: 40,),   
          Text('Progress: ${(model.progress * 100).toStringAsFixed(0)}%'),
          const SizedBox(height: 40,),   
          CircularProgressIndicator(value: model.progress, color: Colors.blue, ),
          model.isLoading ? const SizedBox( height: 20,) : ElevatedButton(
            onPressed: () => model.postData(context), 
            child: const Text("Send Data"))
        ],
      ),
    );
  }
}