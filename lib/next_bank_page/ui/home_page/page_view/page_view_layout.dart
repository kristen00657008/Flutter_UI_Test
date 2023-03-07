import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ui_test/next_bank_page/next_bank_page_bloc.dart';

import 'first_page/first_page_view.dart';
import 'second_page/second_page_view.dart';

class PageViewLayout extends StatelessWidget {
  final ViewState state;

  const PageViewLayout({Key? key, required this.state}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<NextBankPageBloc>(context);
    return (state is CardViewState)
        ? SlideTransition(
            position: bloc.pageViewPositionAnim,
            child: layout(context, bloc),
          )
        : layout(context, bloc);
  }

  Widget layout(BuildContext context, NextBankPageBloc bloc) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: SizedBox(
        height: MediaQuery.of(context).size.height * bloc.initHeight,
        child: BlocBuilder<NextBankPageBloc, ViewState>(
          builder: (context, state) {
            return PageView.builder(
              controller: bloc.pageController,
              itemCount: 4,
              itemBuilder: (BuildContext context, int index) {
                if (index == 0) {
                  return FirstPageView();
                } else {
                  return SecondPageView();
                }
              },
            );
          },
        ),
      ),
    );
  }
}
