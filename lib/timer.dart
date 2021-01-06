import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'counter.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

/// ProviderのCounter選択
final provider = StateNotifierProvider(
        (ref) => CounterNotifier()
);

class Timer extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final counterModel = useProvider(provider.state);
    return Scaffold(
      appBar: AppBar(
        title: Text('Timer'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('You have pushed the button this many times:'),
            CounterTextWidget(),
            Container(
              width: double.infinity,
              child: FlatButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => Timer()));
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read(provider).increment();
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}

class CounterTextWidget extends HookWidget {
  const CounterTextWidget({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    print('building CounterTextWidget');
    final counterModel = useProvider(provider.state);
    return Text(
      '${counterModel.count}',
      style: Theme.of(context).textTheme.headline4,
    );
  }
}