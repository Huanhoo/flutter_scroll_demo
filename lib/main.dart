// Step 4: Create an infinite scrolling lazily loaded list

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Startup Name Generator',
      home: new MyAppPage(),
    );
  }
}

class MyAppPage extends StatefulWidget {
  @override
  createState() => new MyAppState();
}

class MyAppState extends State<MyAppPage> {

  final TextStyle _biggerFont = new TextStyle(fontSize: 18.0);
  static const kMethodChannel = const MethodChannel('com.apple.flutter/flutter_method');

  _push() {
    kMethodChannel.invokeMethod("push");
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: _buildSuggestions(),
      floatingActionButton: FloatingActionButton(
        onPressed: _push,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),


    );
  }

  Widget _buildSuggestions() {
    return new ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemCount: 100,
      itemBuilder: (context, i) => GestureDetector(
          onTap: () => _push(),
          child: _buildRow("1")


      ),
    );
  }

  Widget _buildRow(String string) {
    return new ListTile(
      title: new Text(
        string,
        style: _biggerFont,
      ),
    );
  }
}