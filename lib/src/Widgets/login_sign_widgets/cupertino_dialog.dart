import 'package:flutter/cupertino.dart';

class CupertinoDialogSingleAction extends StatelessWidget {
  final String content;
  final String actionText;
  final void Function() onPressed;
  const CupertinoDialogSingleAction({this.content = "error",this.actionText = "Accept",@required this.onPressed, Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      content: Text(content),
      actions: <Widget>[
        CupertinoDialogAction(
          isDefaultAction: true,
          child: Text(actionText),
          onPressed: onPressed,
        ),
      ],
    );
  }
}
