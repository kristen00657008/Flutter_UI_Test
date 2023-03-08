import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ui_test/next_bank_page/next_bank_page_bloc.dart';

class TopBarView extends StatelessWidget {
  final ViewState? state;

  const TopBarView({Key? key, this.state}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.topCenter,
        child: (state is OriginState)
            ? buildOriginButtonRow(context)
            : (state is CardShowState)
                ? buildCardShowButtonRow()
                : (state is PageViewState)
                    ? buildOriginButtonRow(context)
                    : Container());
  }

  Widget buildOriginButtonRow(BuildContext context) {
    final bloc = BlocProvider.of<NextBankPageBloc>(context);
    return Row(
      children: [
        Spacer(),
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.add),
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.add),
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.add),
        ),
      ],
    );
  }

  Widget buildCardShowButtonRow() {
    return Row(
      children: [
        Spacer(),
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.mail),
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.mail),
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.mail),
        ),
      ],
    );
  }
}
