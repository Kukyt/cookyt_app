import 'package:flutter/material.dart';

class SignUpWithButton extends StatelessWidget {
  final String imagePath;
  final void Function() onTap;

  const SignUpWithButton({
    @required this.imagePath,
    @required this.onTap,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        width: 58.0,
        height: 58.0,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage(imagePath),
          ),
        ),
      ),
      onTap: onTap,
    );
  }
}
