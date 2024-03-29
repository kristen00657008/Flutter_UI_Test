import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ui_test/next_bank_page/next_bank_page_bloc.dart';
import 'package:flutter_ui_test/next_bank_page/ui/home_page/resource/page%20parameters.dart';

import 'first_page/first_page_view.dart';
import 'second_page/second_page_view.dart';

class PageViewLayout extends StatefulWidget {
  final ViewState state;

  const PageViewLayout({Key? key, required this.state}) : super(key: key);

  @override
  State<PageViewLayout> createState() => _PageViewLayoutState();
}

class _PageViewLayoutState extends State<PageViewLayout> {
  late NextBankPageBloc bloc;

  @override
  void initState() {
    super.initState();
    bloc = BlocProvider.of<NextBankPageBloc>(context);
    bloc.pageController = PageController(viewportFraction: 0.92);
    bloc.pageController.addListener(() {
      bloc.cardOffset.value = bloc.pageController.offset;
    });
  }

  @override
  Widget build(BuildContext context) {
    return (widget.state is CardViewState)
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
        height: MediaQuery.of(context).size.height * pageViewInitHeight,
        child: BlocBuilder<NextBankPageBloc, ViewState>(
          builder: (context, state) {
            return PageView.builder(
              physics: AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics()),
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

  @override
  void dispose() {
    super.dispose();
    // bloc.pageController.dispose();
  }
}
