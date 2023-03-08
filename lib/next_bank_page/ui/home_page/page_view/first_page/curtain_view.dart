import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ui_test/next_bank_page/next_bank_page_bloc.dart';

class CurtainView extends StatelessWidget {
  const CurtainView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<NextBankPageBloc>(context);
    return BlocBuilder<NextBankPageBloc, ViewState>(
      builder: (context, state) {
        return InkWell(
          onTap: () {},
          child: Align(
            alignment: Alignment.topCenter,
            child: AnimatedBuilder(
              animation: bloc.pageViewAnimController,
              builder: (context, child) {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * bloc.curtainHeightAnim.value,
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
