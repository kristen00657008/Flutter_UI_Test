import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ui_test/next_bank_page/next_bank_page_bloc.dart';
import 'package:flutter_ui_test/next_bank_page/ui/home_page/resource/page%20parameters.dart';

class ListViewTopBar extends StatelessWidget {
  const ListViewTopBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<NextBankPageBloc>(context);
    return AnimatedBuilder(
      animation: bloc.pageViewAnimController,
      builder: (context, child) {
        return Container(
          width: MediaQuery.of(context).size.width,
          height: (bloc.state is PageViewState) ? bloc.listViewTopBarHeightAnim.value : listViewTopBarInitHeight,
          padding: EdgeInsets.symmetric(
            vertical: ((bloc.state is PageViewState) ? bloc.listViewTopBarHeightAnim.value  : listViewTopBarInitHeight) / 2.5,
            horizontal: MediaQuery.of(context).size.width * 0.35,
          ),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.grey[400],
              borderRadius: BorderRadius.circular(15),
            ),
          ),
        );
      },
    );
  }
}
