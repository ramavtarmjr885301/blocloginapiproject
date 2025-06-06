
import 'package:blocloginapiproject/BLoC/counter_bloc/counter_bloc.dart';
import 'package:blocloginapiproject/BLoC/counter_bloc/counter_event.dart';
import 'package:blocloginapiproject/BLoC/counter_bloc/counter_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  @override
  Widget build(BuildContext context) {
    print("build");

    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title:const Text("Counter App"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            BlocBuilder<CounterBloc, CounterState>(
              builder: (context, state) {
                return Center(child: Text(state.counter.toString(),style:const TextStyle(fontSize: 100),));
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                    onPressed: () {
                      context.read<CounterBloc>().add(DecrementEvent());
                     print('Decrement');
                    },
                    child:const Text("Decrement")),
                ElevatedButton(
                    onPressed: () {
                      context.read<CounterBloc>().add(IncrementEvent());
                      print('Increment');
                    },
                    child:const Text("Increment")),
              ],
            )
          ],
        ));
  }
}
