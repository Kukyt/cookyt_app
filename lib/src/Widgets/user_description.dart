import 'package:cookyt_app/src/styles/profile_screen_styles.dart';
import 'package:flutter/material.dart'
;
class DescriptionTextWidget extends StatefulWidget {
  final String text;

  DescriptionTextWidget({@required this.text});

  @override
  _DescriptionTextWidgetState createState() => _DescriptionTextWidgetState();
}

class _DescriptionTextWidgetState extends State<DescriptionTextWidget> {
  String firstHalf;
  String secondHalf;

  bool flag = true;

  @override
  void initState() {
    super.initState();

    if (widget.text.length > 50) {
      firstHalf = widget.text.substring(0, 50);
      secondHalf = widget.text.substring(50, widget.text.length);
    } else {
      firstHalf = widget.text;
      secondHalf = "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: secondHalf.isEmpty
          ? Text(
              firstHalf,
              style: descriptionStyle,
              textAlign: TextAlign.center,
            )
          : GestureDetector(
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  children: flag
                      ? [
                          TextSpan(text: firstHalf, style: descriptionStyle),
                          TextSpan(
                              text: " ...",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20.0,
                                color: Colors.green[100],
                              ))
                        ]
                      : [
                          TextSpan(
                            text: firstHalf + secondHalf,
                            style: descriptionStyle,
                          )
                        ],
                ),
              ),
              onTap: () => setState(() {
                flag = !flag;
              }),
            ),
    );
  }
}
