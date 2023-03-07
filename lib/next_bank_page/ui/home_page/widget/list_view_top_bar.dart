import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ui_test/next_bank_page/next_bank_page_bloc.dart';

class ListViewTopBar extends StatelessWidget {
  const ListViewTopBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<NextBankPageBloc>(context);
    return AnimatedContainer(
      duration: Duration.zero,
      width: MediaQuery.of(context).size.width,
      height: bloc.listViewTopBarHeight,
      padding: EdgeInsets.symmetric(
        vertical: bloc.listViewTopBarHeight / 2.5,
        horizontal: MediaQuery.of(context).size.width * 0.35,
      ),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[400],
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
