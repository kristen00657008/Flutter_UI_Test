import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ui_test/next_bank_page/next_bank_page_bloc.dart';
import 'package:flutter_ui_test/next_bank_page/ui/home_page/card_view/card_origin_view.dart';
import 'package:flutter_ui_test/next_bank_page/ui/home_page/page_view/page_view_layout.dart';
import 'package:flutter_ui_test/next_bank_page/ui/home_page/top_bar_view.dart';

class OriginStateView extends StatefulWidget {
  const OriginStateView({Key? key}) : super(key: key);

  @override
  State<OriginStateView> createState() => _OriginStateViewState();
}

class _OriginStateViewState extends State<OriginStateView> {
  late NextBankPageBloc bloc;

  @override
  void initState() {
    super.initState();
    bloc = BlocProvider.of<NextBankPageBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          TopBarView(state: OriginState()),
          CardOriginView(),
          PageViewLayout(state: OriginState()),
        ],
      ),
    );
  }
}
