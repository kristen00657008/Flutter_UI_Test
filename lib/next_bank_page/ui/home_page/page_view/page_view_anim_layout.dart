import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ui_test/next_bank_page/next_bank_page_bloc.dart';
import 'package:flutter_ui_test/next_bank_page/ui/home_page/page_view/first_page/first_page_expanded_view.dart';

import 'second_page/second_page_view.dart';

class PageViewAnimLayout extends StatelessWidget {
  final ViewState state;

  const PageViewAnimLayout({Key? key, required this.state}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<NextBankPageBloc>(context);
    return AnimatedContainer(
      width: MediaQuery.of(context).size.width * bloc.pageViewWidth,
      height: MediaQuery.of(context).size.height * bloc.pageViewHeight,
      duration: Duration(milliseconds: 500),
      child: PageView.builder(
        controller: bloc.pageController,
        itemCount: 4,
        itemBuilder: (BuildContext context, int index) {
          if (index == 0) {
            return FirstPageExpandedView();
          } else {
            return SecondPageView();
          }
        },
      ),
    );
  }
}
