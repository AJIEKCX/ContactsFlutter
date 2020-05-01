import 'package:flutter/material.dart';

class EmptyStub extends StatelessWidget {
  final String text;
  final bool isVisible;

  EmptyStub({@required this.text, this.isVisible = true});

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: isVisible,
      child: Center(child: Text(text)),
    );
  }
}
