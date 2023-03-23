import 'package:flutter/material.dart';

class CardPositionedView extends StatelessWidget {
  final Widget child;
  const CardPositionedView({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Positioned(
      top: MediaQuery.of(context).size.height * 0.1,
      left: MediaQuery.of(context).size.width * 0.85,
      child: child,
    );
  }
}
