import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:webspark_test/ui/widgets/home_page/home_page_model.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar( 
        title: const Text("Home screen"),
      ),
      body: const _HomePageColumnWidget(),
    );
  }
}

class _HomePageColumnWidget extends StatelessWidget {
  const _HomePageColumnWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding:  EdgeInsets.symmetric(horizontal: 14),
      child: Column(       
        children: [
          SizedBox(height: 20,),
          Text("Set valid API base URL in order to continue"),
          _APIRowWidget(),
          Spacer(),
          _HomePageButtonWidget(),
          SizedBox(height: 10,)
        ],
      ),
    );
  }
}

class _HomePageButtonWidget extends StatelessWidget {
  const _HomePageButtonWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final model = context.read<HomePageModel>();
    return ElevatedButton(
      
      style: const ButtonStyle(
        
        padding: WidgetStatePropertyAll(EdgeInsets.symmetric(horizontal: 100, )),
      ),
      onPressed: () => model.goToNextScreen(context), 
      child: const Text("Start")
      );
  }
}

class _APIRowWidget extends StatelessWidget {
  const _APIRowWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final model = context.select((HomePageModel model) => model);
    return  Row(
      children: [
        const Icon(Icons.sync_alt_sharp),
        const SizedBox(width: 20,),
        Expanded(
          child: TextField(
            onChanged: (value) => model.urlAdress = value,
          )),
      ],
    );
  }
}