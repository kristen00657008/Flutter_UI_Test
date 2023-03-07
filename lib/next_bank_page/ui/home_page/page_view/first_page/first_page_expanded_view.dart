import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ui_test/next_bank_page/next_bank_page_bloc.dart';
import 'package:flutter_ui_test/next_bank_page/ui/home_page/widget/list_view_top_bar.dart';

import 'consumer_list_view/consumer_detail_list.dart';

class FirstPageExpandedView extends StatefulWidget {
  const FirstPageExpandedView({Key? key}) : super(key: key);

  @override
  State<FirstPageExpandedView> createState() => _FirstPageExpandedViewState();
}

class _FirstPageExpandedViewState extends State<FirstPageExpandedView> {
  late NextBankPageBloc bloc;
  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    bloc = BlocProvider.of<NextBankPageBloc>(context);
    scrollController.addListener(() {
      if (scrollController.offset < -50) {
        if (bloc.state is! PageViewAnimatingState) {
          bloc.closePageView();
        }
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NextBankPageBloc, ViewState>(
      builder: (context, state) {
        return InkWell(
          onTap: () {
            print("Tap..+ " + state.toString());
          },
          child: AnimatedContainer(
            duration: bloc.defaultDuration,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(bloc.pageViewRadius),
                topRight: Radius.circular(bloc.pageViewRadius),
              ),
            ),
            child: Column(
              children: [
                ListViewTopBar(),
                Expanded(
                  child: ConsumerDetailList(
                    scrollAble: true,
                    scrollController: scrollController,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
