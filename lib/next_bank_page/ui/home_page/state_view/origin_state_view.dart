import 'package:flutter/material.dart';
import 'package:flutter_ui_test/next_bank_page/next_bank_page_bloc.dart';
import 'package:flutter_ui_test/next_bank_page/ui/home_page/card_view/card_origin_view.dart';
import 'package:flutter_ui_test/next_bank_page/ui/home_page/page_view/page_view_origin_layout.dart';
import 'package:flutter_ui_test/next_bank_page/ui/home_page/top_bar_view.dart';

class OriginStateView extends StatelessWidget {
  const OriginStateView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          TopBarView(state: OriginState()),
          CardOriginView(),
          PageViewOriginLayout(state: OriginState()),
        ],
      ),
    );
  }
}
