import 'package:flutter/material.dart';

class CardView extends StatelessWidget {
  const CardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.height * 0.3,
      height: MediaQuery.of(context).size.width * 0.45,
      decoration: BoxDecoration(
        color: Colors.black,
        border: Border.all(color: Colors.yellow, width: 4),
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
