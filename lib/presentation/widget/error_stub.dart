import 'package:contacts_flutter/generated/l10n.dart';
import 'package:flutter/material.dart';

class ErrorStub extends StatelessWidget {
  final VoidCallback onPressed;
  final String errorText;

  ErrorStub({@required this.onPressed, @required this.errorText});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(errorText),
          RaisedButton(
            onPressed: onPressed,
            child: Text(S.of(context).refresh_title.toUpperCase()),
          )
        ],
      ),
    );
  }
}
