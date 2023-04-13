import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ui_test/next_bank_page/next_bank_page_bloc.dart';
import 'package:flutter_ui_test/widget/custom_text.dart';
import 'package:shimmer/shimmer.dart';

class ConsumerDetailListItem extends StatelessWidget {
  const ConsumerDetailListItem({Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NextBankPageBloc, ViewState>(
      builder: (context, state) {
        return Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            child: state is RefreshDataState
                ? Shimmer.fromColors(
                    baseColor: Colors.black12,
                    highlightColor: Colors.white,
                    direction: ShimmerDirection.ltr,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        buildLoadingWidget(80),
                        buildLoadingWidget(150)
                      ],
                    ),
                  )
                : Column(
                    children: [
                      buildFirstRow(),
                      buildSecondRow(),
                    ],
                  ));
      },
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

  Widget buildLoadingWidget(double width) {
    return Container(
      width: width,
      height: 15,
      margin: const EdgeInsets.only(left: 28.0, right: 28, top: 13, bottom: 14),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8), color: Colors.white),
    );
  }
}
