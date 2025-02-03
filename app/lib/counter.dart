import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CounterProvider extends ChangeNotifier {
  int coutner = 0;

  int get counter => coutner;

  void incrementCounter() {
    coutner++;
    notifyListeners();
  }
}

class Counter extends StatelessWidget {
  const Counter({super.key});

  @override
  Widget build(BuildContext context) {
    final counterProvider = context.watch<CounterProvider>();

    return Column(
      children: [
        Text('${counterProvider.counter}'),
        TextButton(
          onPressed: () => context.read<CounterProvider>().incrementCounter(),
          child: const Text('Increment counter'),
        ),
      ],
    );
  }
}
