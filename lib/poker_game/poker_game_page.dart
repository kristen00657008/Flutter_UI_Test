import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_ui_test/poker_game/model/card_model.dart';

class PokerGamePage extends StatefulWidget {
  const PokerGamePage({Key? key}) : super(key: key);

  @override
  State<PokerGamePage> createState() => _PokerGamePageState();
}

class _PokerGamePageState extends State<PokerGamePage>
    with SingleTickerProviderStateMixin {
  List<CardModel> randomCardList = [];
  bool flipping = false;
  int currentFlipIndex = -1;
  late List<bool> showFrontSide;

  @override
  void initState() {
    super.initState();
    initGame();
  }

  void initGame() {
    setState(() {
      randomCardList =
          cardList.map((cardModel) => CardModel.clone(cardModel)).toList();
      randomCardList.shuffle();
      randomCardList.removeRange(8, randomCardList.length);
      randomCardList.addAll(List.from(randomCardList));
      randomCardList.shuffle();
      showFrontSide = List.generate(randomCardList.length, (index) => true);
      flipping = false;
      currentFlipIndex = -1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: InkWell(
            onTap: () {
              randomCardList[1].isLock = true;
            },
            child: Text("PokerGamePage")),
        actions: [
          IconButton(
              onPressed: () {
                initGame();
              },
              icon: Icon(Icons.refresh))
        ],
      ),
      body: DefaultTextStyle(
        style: TextStyle(color: Colors.white),
        textAlign: TextAlign.center,
        child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              childAspectRatio: 0.55,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
            ),
            padding: EdgeInsets.all(10),
            itemCount: randomCardList.length,
            itemBuilder: (context, index) {
              return Container(
                constraints: BoxConstraints.tight(Size.square(200.0)),
                child: _buildFlipAnimation(index),
              );
            }),
      ),
    );
  }

  void _switchCard(int index) {
    if (flipping) return;
    setState(() {
      if (!randomCardList[index].isLock && index != currentFlipIndex) {
        showFrontSide[index] = !showFrontSide[index];
      }
    });
  }

  Widget _buildFlipAnimation(int index) {
    return GestureDetector(
      onTap: () {
        _switchCard(index);
      },
      child: AnimatedSwitcher(
        duration: Duration(milliseconds: 400),
        transitionBuilder: (widget, animation) {
          return _transitionBuilder(widget, animation, index);
        },
        layoutBuilder: (widget, list) =>
            Stack(children: [widget ?? Container(), ...list]),
        child: showFrontSide[index] ? _buildFront() : _buildRear(index),
      ),
    );
  }

  Widget _transitionBuilder(
      Widget widget, Animation<double> animation, int index) {
    animation.addStatusListener((status) {
      animationListener(status, index);
    });
    final rotateAnim = Tween(begin: pi, end: 0.0).animate(animation);
    return AnimatedBuilder(
      animation: rotateAnim,
      child: widget,
      builder: (context, widget) {
        final isUnder = (ValueKey(showFrontSide[index]) != widget?.key);
        var tilt = ((animation.value - 0.5).abs() - 0.5) * 0.003;
        tilt *= isUnder ? -1.0 : 1.0;
        final value =
            isUnder ? min(rotateAnim.value, pi / 2) : rotateAnim.value;
        return Transform(
          transform: (Matrix4.rotationY(value)..setEntry(3, 0, tilt)),
          child: widget,
          alignment: Alignment.center,
        );
      },
    );
  }

  Widget _buildFront() {
    return __buildLayout(
      key: ValueKey(true),
      backgroundColor: Colors.brown,
      faceName: "Front",
      child: Padding(
        padding: EdgeInsets.all(32.0),
        child: ColorFiltered(
          colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcATop),
          child: FlutterLogo(),
        ),
      ),
    );
  }

  Widget _buildRear(int index) {
    return __buildLayout(
      key: ValueKey(false),
      backgroundColor: Colors.blue.shade700,
      faceName: "",
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: ColorFiltered(
          colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcATop),
          child: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(randomCardList[index].number.toString(),
                  style: TextStyle(fontSize: 25.0)),
              Text("of", style: TextStyle(fontSize: 25.0)),
              Text(randomCardList[index].suit.toString(),
                  style: TextStyle(fontSize: 15.0)),
            ],
          )),
        ),
      ),
    );
  }

  Widget __buildLayout(
      {required Key key,
      required Widget child,
      required String faceName,
      required Color backgroundColor}) {
    return Container(
      key: key,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Stack(
        fit: StackFit.expand,
        children: [
          child,
          Positioned(
            bottom: 8.0,
            right: 8.0,
            child: Text(faceName),
          ),
        ],
      ),
    );
  }

  void animationListener(AnimationStatus status, int index) {
    if (status == AnimationStatus.completed) {
      flipping = false;
      if (!showFrontSide[index]) {
        if (currentFlipIndex == -1) {
          currentFlipIndex = index;
        } else {
          if (randomCardList[index] == randomCardList[currentFlipIndex]) {
            randomCardList[currentFlipIndex].isLock = true;
            randomCardList[index].isLock = true;
            currentFlipIndex = -1;
          } else {
            setState(() {
              showFrontSide[currentFlipIndex] = true;
              showFrontSide[index] = true;
            });
            currentFlipIndex = -1;
          }
        }
      } else {
        currentFlipIndex = -1;
      }
    } else {
      flipping = true;
    }
  }
}
