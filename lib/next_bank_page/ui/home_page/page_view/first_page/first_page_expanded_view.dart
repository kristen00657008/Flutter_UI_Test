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


  @override
  void initState() {
    super.initState();
    bloc = BlocProvider.of<NextBankPageBloc>(context);
    bloc.listViewScrollController = ScrollController();
    bloc.listViewScrollController.addListener(() {
      if (bloc.listViewScrollController.offset < -50) {
        if (bloc.state is PageViewShowState) {
          bloc.closePageView();
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NextBankPageBloc, ViewState>(
      builder: (context, state) {
        return Align(
          alignment: Alignment.bottomCenter,
          child: AnimatedContainer(
            width: MediaQuery.of(context).size.width *
                bloc.pageViewWidth,
            height: MediaQuery.of(context).size.height *
                bloc.pageViewHeight,
            duration: Duration(milliseconds: 500),
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
                    scrollAble: (state is PageViewShowState),
                    scrollController: bloc.listViewScrollController,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    bloc.listViewScrollController.dispose();
  }
}
