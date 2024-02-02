import 'package:flutter/material.dart';
import 'modelo.dart';

// screen_a.dart

class ScreenA extends StatelessWidget {
  final CounterModel counterModel;
  final Function(int) updateCallback;

  ScreenA({required this.counterModel, required this.updateCallback});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pantalla A'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Contador en Pantalla A: ${counterModel.counter}',
              style: TextStyle(fontSize: 20),
              selectionColor: Colors.green,
            ),
            SizedBox(height: 20),
            FloatingActionButton(
              onPressed: () {
                updateCallback(counterModel.counter + 1);
              },
              tooltip: 'Incrementar Contador',
              child: Icon(Icons.add),
              backgroundColor: Colors.green,
            ),
          ],
        ),
      ),
    );
  }
}
