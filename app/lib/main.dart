import 'package:flutter/material.dart';
import 'modelo.dart';
import 'pantallaA.dart';
import 'pantallaB.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late CounterModel counterModel;

  @override
  void initState() {
    super.initState();
    counterModel = CounterModel(1);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(
          counterModel: counterModel, updateCallback: _updateCounter),
    );
  }

  void _updateCounter(int newCounterValue) {
    setState(() {
      counterModel.counter = newCounterValue;
    });
  }
}

class MyHomePage extends StatelessWidget {
  final CounterModel counterModel;
  final Function(int) updateCallback;

  MyHomePage({required this.counterModel, required this.updateCallback});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Página Principal'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Contador: ${counterModel.counter}',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ScreenA(
                      counterModel: counterModel,
                      updateCallback: updateCallback,
                    ),
                  ),
                );
              },
              child: Text('Ir a Pantalla A'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ScreenB(
                      counterModel: counterModel,
                      updateCallback: updateCallback,
                    ),
                  ),
                );
              },
              child: Text('Ir a Pantalla B'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          updateCallback(counterModel.counter + 1);
        },
        tooltip: 'Incrementar Contador',
        child: Icon(Icons.add),
      ),
    );
  }
}

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
            ),
            SizedBox(height: 20),
            FloatingActionButton(
              onPressed: () {
                updateCallback(counterModel.counter + 1);
              },
              tooltip: 'Incrementar Contador',
              child: Icon(Icons.add),
            ),
          ],
        ),
      ),
    );
  }
}

class ScreenB extends StatelessWidget {
  final CounterModel counterModel;
  final Function(int) updateCallback;

  ScreenB({required this.counterModel, required this.updateCallback});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pantalla B'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Contador en Pantalla B: ${counterModel.counter}',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 20),
            FloatingActionButton(
              onPressed: () {
                updateCallback(counterModel.counter + 1);
              },
              tooltip: 'Incrementar Contador',
              child: Icon(Icons.add),
            ),
          ],
        ),
      ),
    );
  }
}
