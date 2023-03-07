import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ui_test/next_bank_page/next_bank_page_bloc.dart';
import 'package:flutter_ui_test/next_bank_page/ui/home_page/card_view/card_view.dart';

class CardAnimView extends StatefulWidget {
  const CardAnimView({Key? key}) : super(key: key);

  @override
  _CardAnimViewState createState() => _CardAnimViewState();
}

class _CardAnimViewState extends State<CardAnimView> {
  late NextBankPageBloc bloc;

  @override
  void initState() {
    super.initState();
    bloc = BlocProvider.of<NextBankPageBloc>(context);
  }

  @override
  void dispose() {
    bloc.cardAnimController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Center(
        child: SlideTransition(
          position: bloc.cardPositionAnim,
          child: ScaleTransition(
            scale: bloc.cardScaleAnim,
            child: RotationTransition(
              turns: bloc.cardRotationAnim,
              child: InkWell(
                onTap: () {
                  bloc.add(CardHideAnimEvent());
                  bloc.cardAnimController
                      .reverse()
                      .whenComplete(() => bloc.add(CardHideEvent()));
                },
                child: CardView(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
