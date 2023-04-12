import 'package:flutter/material.dart';
import 'package:flutter_ui_test/widget/custom_text.dart';
import 'package:shimmer/shimmer.dart';

class ConsumerDetailListItem extends StatelessWidget {
  final bool showData;

  const ConsumerDetailListItem({Key? key, required this.showData})
      : super(key: key);

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
      child: showData
          ? Column(
              children: [
                buildFirstRow(),
                buildSecondRow(),
              ],
            )
          : Shimmer.fromColors(
              baseColor: Colors.black12,
              highlightColor: Colors.white,
              direction: ShimmerDirection.ltr,
              child: Column(
                children: [
                  buildFirstLoadRow(),
                  buildSecondLoadRow(),
                ],
              ),
            ),
    );
  }

  Widget buildFirstRow() {
    return Padding(
      padding: const EdgeInsets.only(left: 28.0, right: 28, top: 12, bottom: 5),
      child: Row(
        children: const [
          CustomText(text: "轉入", fontSize: 18),
          Spacer(),
          CustomText(text: "3,118", fontSize: 18),
        ],
      ),
    );
  }

  Widget buildFirstLoadRow() {
    return Padding(
      padding: const EdgeInsets.only(left: 28.0, right: 28, top: 12, bottom: 5),
      child: Row(
        children: [
          Container(
              width: 80,
              height: 25,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), color: Colors.red)),
          Spacer(),
          Container(
              width: 80,
              height: 25,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), color: Colors.red)),
        ],
      ),
    );
  }

  Widget buildSecondRow() {
    return Padding(
      padding: const EdgeInsets.only(left: 28.0, right: 28, top: 8, bottom: 8),
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

  Widget buildSecondLoadRow() {
    return Padding(
      padding: const EdgeInsets.only(left: 28.0, right: 28, top: 8, bottom: 8),
      child: Row(
        children: [
          Container(
              width: 150,
              height: 25,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), color: Colors.red)),
          Spacer(),
          Container(
              width: 35,
              height: 25,
              padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 2),
              margin: EdgeInsets.symmetric(vertical: 2),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), color: Colors.red)),
        ],
      ),
    );
  }
}
