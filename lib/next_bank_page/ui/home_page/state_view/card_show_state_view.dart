import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ui_test/next_bank_page/next_bank_page_bloc.dart';
import 'package:flutter_ui_test/next_bank_page/ui/home_page/card_view/card_anim_view.dart';
import 'package:flutter_ui_test/next_bank_page/ui/home_page/page_view/page_view_layout.dart';
import 'package:flutter_ui_test/next_bank_page/ui/home_page/top_bar_view.dart';

class CardShowStateView extends StatefulWidget {
  const CardShowStateView({Key? key}) : super(key: key);

  @override
  State<CardShowStateView> createState() => _CardShowStateViewState();
}

class _CardShowStateViewState extends State<CardShowStateView>
    with SingleTickerProviderStateMixin {
  late NextBankPageBloc bloc;

  @override
  void initState() {
    super.initState();
    bloc = BlocProvider.of<NextBankPageBloc>(context);
    // 初始化動畫控制器
    bloc.cardAnimController = AnimationController(
      duration: bloc.defaultDuration,
      vsync: this,
    );

    bloc.initCardShowAnim();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocBuilder<NextBankPageBloc, ViewState>(
        builder: (context, state) {
          return Stack(
            children: [
              TopBarView(state: state),
              PageViewLayout(state: state),
              CardAnimView(),
            ],
          );
        },
      ),
    );
  }
}
