import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ui_test/color_bloc/blocs/color/color_bloc.dart';

class ColorBlocPage extends StatelessWidget {
  const ColorBlocPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ColorBloc(),
      child: BlocBuilder<ColorBloc, ColorState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(),
            body: Container(
              color: state.color,
            ),
            floatingActionButton: FloatingActionButton(onPressed: () {
              context.read<ColorBloc>().add(ChangeColorEvent());
            }),
          );
        },
      ),
    );
  }
}
