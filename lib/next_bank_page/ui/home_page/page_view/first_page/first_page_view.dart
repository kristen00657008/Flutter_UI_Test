import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ui_test/next_bank_page/next_bank_page_bloc.dart';
import 'package:flutter_ui_test/next_bank_page/ui/home_page/widget/list_view_top_bar.dart';

import 'consumer_list_view/consumer_detail_list.dart';

class FirstPageView extends StatefulWidget {
  const FirstPageView({Key? key}) : super(key: key);

  @override
  State<FirstPageView> createState() => _FirstPageViewState();
}

class _FirstPageViewState extends State<FirstPageView> {
  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<NextBankPageBloc>(context);
    return GestureDetector(
      onVerticalDragUpdate: (detail) {
        if (detail.delta.dy < -0.5) {
          bloc.add(PageViewExpandingEvent());
        }
      },
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          width: MediaQuery.of(context).size.width * bloc.initWidth,
          height: MediaQuery.of(context).size.height * bloc.initHeight,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: Column(
            children: const [
              ListViewTopBar(),
              Expanded(
                child: ConsumerDetailList(
                  scrollAble: false,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
