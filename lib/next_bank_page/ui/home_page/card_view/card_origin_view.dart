import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ui_test/next_bank_page/next_bank_page_bloc.dart';
import 'package:flutter_ui_test/next_bank_page/ui/home_page/card_view/card_view.dart';

class CardOriginView extends StatefulWidget {
  const CardOriginView({Key? key}) : super(key: key);

  @override
  _CardOriginViewState createState() => _CardOriginViewState();
}

class _CardOriginViewState extends State<CardOriginView>
    with SingleTickerProviderStateMixin {
  late NextBankPageBloc bloc;

  @override
  void initState() {
    super.initState();
    bloc = BlocProvider.of<NextBankPageBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<double>(
      valueListenable: bloc.cardOffset,
      builder: (BuildContext context, offset, Widget? child) {
        return Positioned(
          top: MediaQuery.of(context).size.height * 0.1,
          left: MediaQuery.of(context).size.width * 0.8,
          child: Transform.scale(
            scale: offset <= 30 ? 1 : (30 / offset),
            child: InkWell(
              onTap: () {
                if (bloc.state is OriginState) {
                  bloc.add(CardShowAnimEvent());
                }
              },
              child: CardView(),
            ),
          ),
        );
      },
    );
  }
}
