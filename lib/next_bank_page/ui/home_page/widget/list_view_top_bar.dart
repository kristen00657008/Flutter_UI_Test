import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ui_test/next_bank_page/next_bank_page_bloc.dart';

class ListViewTopBar extends StatelessWidget {
  const ListViewTopBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<NextBankPageBloc>(context);
    return Container(
      width: MediaQuery.of(context).size.width * 0.3,
      height: bloc.listViewTopBarHeight,
      margin: EdgeInsets.symmetric(vertical: 15),
      decoration: BoxDecoration(
        color: Colors.grey[400],
        borderRadius: BorderRadius.circular(15),
      ),
    );
  }
}
