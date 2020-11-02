import 'package:flutter/material.dart';

class TalksPage extends StatefulWidget {
  TalksPage({Key key}) : super(key: key);

  @override
  _TalksPageState createState() => _TalksPageState();
}

class _TalksPageState extends State<TalksPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("talks"),
      ),
    );
  }
}
