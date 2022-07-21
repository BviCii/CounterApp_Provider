import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

main() {
  runApp(ChangeNotifierProvider(
    create: (_) => CounterProvider(),
    child: MaterialApp(
      home: HomeScreen(),
    ),
  ));
}

class CounterProvider extends ChangeNotifier {
  int _counter = 100;
  int get counter => _counter;
  void add() {
    _counter++;
    notifyListeners();
  }
}

// class CounterHome extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//           child: Text(
//         context.watch<CounterProvider>().counter.toString(),
//         style: TextStyle(fontSize: 30),
//       )),
//       floatingActionButton: FloatingActionButton(
//         child: Icon(Icons.add),
//         onPressed: () {
//           context.read<CounterProvider>().add();
//         },
//       ),
//     );
//   }
// }

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              context.watch<CounterProvider>().counter.toString(),
              style: TextStyle(fontSize: 50),
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => SecondScreen()));
                },
                child: Text('Go to second screen')),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<CounterProvider>().add();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Screen'),
        backgroundColor: Colors.red,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              context.watch<CounterProvider>().counter.toString(),
              style: TextStyle(fontSize: 50),
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Back to Home screen')),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<CounterProvider>().add();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
