import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ui_test/next_bank_page/next_bank_page_bloc.dart';
import 'package:flutter_ui_test/next_bank_page/ui/home_page/resource/page%20parameters.dart';

class SecondPageView extends StatefulWidget {
  const SecondPageView({Key? key}) : super(key: key);

  @override
  State<SecondPageView> createState() => _SecondPageViewState();
}

class _SecondPageViewState extends State<SecondPageView> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NextBankPageBloc, ViewState>(
      builder: (context, state) {
        return Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            width: MediaQuery.of(context).size.width * pageViewInitWidth,
            height: MediaQuery.of(context).size.height * pageViewInitHeight,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
            ),
          ),
        );
      },
    );
  }
}
