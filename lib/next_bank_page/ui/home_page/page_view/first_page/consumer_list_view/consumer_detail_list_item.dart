import 'package:flutter/material.dart';
import 'package:flutter_ui_test/widget/custom_text.dart';

class ConsumerDetailListItem extends StatelessWidget {
  const ConsumerDetailListItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        children: [
          buildFirstRow(),
          buildSecondRow(),
        ],
      ),
    );
  }

  Widget buildFirstRow() {
    return Padding(
      padding: const EdgeInsets.only(left: 28.0, right: 28, top: 12,bottom: 5),
      child: Row(
        children: const [
          CustomText(text: "轉入", fontSize: 18),
          Spacer(),
          CustomText(text: "3,118", fontSize: 18),
        ],
      ),
    );
  }

  Widget buildSecondRow() {
    return Padding(
      padding: const EdgeInsets.only(left: 28.0, right: 28, top: 8,bottom: 8),
      child: Row(
        children: [
          CustomText(
            text: "2023/01/03 22:29",
            fontSize: 15,
            color: Colors.grey[400],
          ),
          Spacer(),
          CustomText(
            text: "刷卡",
            fontSize: 12,
            radius: 25,
            backgroundColor: Colors.tealAccent,
            padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 2),
            margin: EdgeInsets.symmetric(vertical: 2),
          ),
        ],
      ),
    );
  }
}
