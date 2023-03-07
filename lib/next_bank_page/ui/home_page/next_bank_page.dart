import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ui_test/next_bank_page/next_bank_page_bloc.dart';
import 'package:flutter_ui_test/next_bank_page/ui/home_page/state_view/card_show_state_view.dart';
import 'package:flutter_ui_test/next_bank_page/ui/home_page/state_view/origin_state_view.dart';
import 'package:flutter_ui_test/next_bank_page/ui/home_page/state_view/page_view_show_state_view.dart';
import 'package:flutter_ui_test/utils/color.dart';

class NextBankPage extends StatefulWidget {
  const NextBankPage({Key? key}) : super(key: key);

  @override
  State<NextBankPage> createState() => _NextBankPageState();
}

class _NextBankPageState extends State<NextBankPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: white01,
        child: BlocBuilder<NextBankPageBloc, ViewState>(
          builder: (context, state) {
            if (state is OriginState) {
              return OriginStateView();
            } else if (state is CardViewState) {
              return CardShowStateView();
            } else if (state is PageViewState) {
              return PageViewShowStateView();
            }
            return Text("Unexpected state..: " + state.toString());
          },
        ),
      ),
    );
  }
}
