// page for chat
import 'package:flutter/material.dart';

class Remote extends StatelessWidget {
  final int index;

  Remote(this.index);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Chat Page')),
      body: Center(child: Text('The details page #$index')),
    );
  }
}
