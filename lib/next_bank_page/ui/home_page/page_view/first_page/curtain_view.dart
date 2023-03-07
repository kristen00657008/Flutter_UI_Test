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
            child: AnimatedContainer(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * bloc.curtainHeight,
              duration: Duration(milliseconds: 400),
              decoration: BoxDecoration(
                color: Colors.white,
              ),
            ),
          ),
        );
      },
    );
  }
}
