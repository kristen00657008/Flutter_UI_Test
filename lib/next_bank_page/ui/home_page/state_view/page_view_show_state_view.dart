import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ui_test/next_bank_page/next_bank_page_bloc.dart';
import 'package:flutter_ui_test/next_bank_page/ui/home_page/card_view/card_origin_view.dart';
import 'package:flutter_ui_test/next_bank_page/ui/home_page/page_view/first_page/curtain_view.dart';
import 'package:flutter_ui_test/next_bank_page/ui/home_page/page_view/first_page/first_page_expanded_view.dart';
import 'package:flutter_ui_test/next_bank_page/ui/home_page/page_view/page_view_layout.dart';
import 'package:flutter_ui_test/next_bank_page/ui/home_page/top_bar_view.dart';

class PageViewShowStateView extends StatefulWidget {
  const PageViewShowStateView({Key? key}) : super(key: key);

  @override
  State<PageViewShowStateView> createState() => _PageViewShowStateViewState();
}

class _PageViewShowStateViewState extends State<PageViewShowStateView>
    with SingleTickerProviderStateMixin {
  late NextBankPageBloc bloc;

  @override
  void initState() {
    super.initState();
    bloc = BlocProvider.of<NextBankPageBloc>(context);
    bloc.openPageView();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NextBankPageBloc, ViewState>(
      builder: (context, state) {
        return SafeArea(
          child: Stack(
            children: [
              CardOriginView(),
              Column(
                children: [
                  Stack(
                    children: [
                      TopBarView(state: state),
                      CurtainView(),
                    ],
                  ),
                  Expanded(
                    child: Stack(
                      children: [
                        PageViewLayout(state: state),
                        FirstPageExpandedView(),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
