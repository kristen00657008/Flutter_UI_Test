import 'package:flutter/material.dart';

class CardView extends StatelessWidget {
  const CardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      height: 220,
      decoration: BoxDecoration(
        color: Colors.black,
        border: Border.all(color: Colors.yellow, width: 4),
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
