import 'package:flutter/material.dart';

Positioned positionedBackground = Positioned(
  top: 0.0,
  child: _Background(),
);

class _Background extends StatelessWidget {
  const _Background({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage('assets/images/backgrounds/fancy_food_bg.png'),
        ),
      ),
    );
  }
}
