import 'package:flutter/material.dart';
import 'Services.dart';
//import 'package:flutter_auth/models/Labels.dart';
import 'models/Labels.dart';

class JsonParseDemo extends StatefulWidget {
  //
  JsonParseDemo() : super();

  @override
  _JsonParseDemoState createState() => _JsonParseDemoState();
}

class _JsonParseDemoState extends State<JsonParseDemo> {
  //
  List<Labels> _labels;
  bool _loading;

  @override
  void initState() {
    super.initState();
    _loading = true;
    Services.getLabels().then((labels) {
      setState(() {
        _labels = labels;
        _loading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(_loading ? 'Loading...' : 'Labels'),
        ),
        body: Container(
          color: Colors.white,
          child: ListView.builder(
            itemCount: null == _labels ? 0 : _labels.length,
            itemBuilder: (context, index) {
              Labels labels = _labels[index];
              return ListTile(
                title: Text(labels.category),
                subtitle: Text(labels.labels.toString()),
              );
            },
          ),
        ),
      ),
    );
  }
}
