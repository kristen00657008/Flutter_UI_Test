import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class ViewChangeEvent {}

class CardShowAnimEvent extends ViewChangeEvent {}

class CardShowEvent extends ViewChangeEvent {}

class CardHideEvent extends ViewChangeEvent {}

class CardHideAnimEvent extends ViewChangeEvent {}

class PageViewExpandingEvent extends ViewChangeEvent {}

class PageViewCompleteExpandEvent extends ViewChangeEvent {}

class PageViewClosingEvent extends ViewChangeEvent {}

class PageViewCompleteCloseEvent extends ViewChangeEvent {}

abstract class ViewState {}

abstract class CardViewState extends ViewState {}

class CardShowState extends CardViewState {}

class CardAnimatingState extends CardViewState {}

abstract class PageViewState extends ViewState {}

class PageViewShowState extends PageViewState {}

class PageViewAnimatingState extends PageViewState {}

class OriginState extends ViewState {}

class NextBankPageBloc extends Bloc<ViewChangeEvent, ViewState> {
  NextBankPageBloc() : super(OriginState()) {
    on<PageViewExpandingEvent>(mapEventToState);
    on<PageViewCompleteExpandEvent>(mapEventToState);
    on<PageViewClosingEvent>(mapEventToState);
    on<PageViewCompleteCloseEvent>(mapEventToState);
    on<CardShowAnimEvent>(mapEventToState);
    on<CardHideEvent>(mapEventToState);
    on<CardShowEvent>(mapEventToState);
    on<CardHideAnimEvent>(mapEventToState);
  }

  PageController pageController = PageController();

  final double initWidth = 0.9;
  final double endWidth = 1;
  final double initHeight = 0.51;
  final double endHeight = 0.88;
  final double curtainInitHeight = 0;
  final double curtainEndHeight = 0.12;
  final double initRadius = 20;
  final double endRadius = 0;
  final double listViewTopBarInitHeight = 5;
  final double listViewTopBarEndHeight = 0;

  double pageViewWidth = 0.9;
  double pageViewHeight = 0.51;
  double pageViewRadius = 20;
  double curtainHeight = 0;
  double listViewTopBarHeight = 5;

  final Duration defaultDuration = Duration(milliseconds: 500);

  late AnimationController cardAnimController;
  late Animation<double> cardRotationAnim;
  late Animation<double> cardScaleAnim;
  late Animation<Offset> cardPositionAnim;
  late Animation<Offset> pageViewPositionAnim;

  void mapEventToState(ViewChangeEvent event, Emitter<ViewState> emit) async {
    if (event is PageViewExpandingEvent) {
      emit(PageViewAnimatingState());
    } else if (event is PageViewCompleteExpandEvent) {
      emit(PageViewShowState());
    } else if (event is PageViewClosingEvent) {
      emit(PageViewAnimatingState());
    } else if (event is PageViewCompleteCloseEvent) {
      emit(OriginState());
    } else if (event is CardShowAnimEvent) {
      emit(CardAnimatingState());
    } else if (event is CardShowEvent) {
      emit(CardShowState());
    } else if (event is CardHideEvent) {
      emit(OriginState());
    } else if (event is CardHideAnimEvent) {
      emit(CardAnimatingState());
    } else {
      emit(OriginState());
    }
  }

  void openPageView() {
    Future.delayed(Duration.zero, (){
      if(state is! PageViewShowState) {
        pageViewWidth = endWidth;
        pageViewHeight = endHeight;
        pageViewRadius = endRadius;
        curtainHeight = curtainEndHeight;
        listViewTopBarHeight = listViewTopBarEndHeight;
        add(PageViewExpandingEvent());
        Future.delayed(defaultDuration, (){
          add(PageViewCompleteExpandEvent());
        });
      }
    });
  }

  void closePageView() {
    if(state is! OriginState) {
      pageViewWidth = initWidth;
      pageViewHeight = initHeight;
      pageViewRadius = initRadius;
      curtainHeight = curtainInitHeight;
      listViewTopBarHeight = listViewTopBarInitHeight;
      add(PageViewClosingEvent());
    }
    Future.delayed(defaultDuration, (){
      add(PageViewCompleteCloseEvent());
    });
  }

  void initCardShowAnim() {
    // 設置旋轉動畫
    cardRotationAnim = Tween<double>(begin: 0, end: -0.25).animate(
      CurvedAnimation(
        parent: cardAnimController,
        curve: Curves.easeInOut,
      ),
    );

    // 設置縮放動畫
    cardScaleAnim = Tween<double>(
      begin: 1,
      end: 1.3,
    ).animate(
      CurvedAnimation(
        parent: cardAnimController,
        curve: Curves.easeInOut,
      ),
    );

    // 設置位置動畫
    cardPositionAnim = Tween<Offset>(
      begin: Offset(0.9, -0.9),
      end: Offset(0, 0),
    ).animate(
      CurvedAnimation(
        parent: cardAnimController,
        curve: Curves.easeInOut,
      ),
    );

    pageViewPositionAnim = Tween<Offset>(
      begin: Offset(0, 0),
      end: Offset(0, 1),
    ).animate(
      CurvedAnimation(
        parent: cardAnimController,
        curve: Curves.easeInOut,
      ),
    );

    cardAnimController.forward().whenComplete(() => add(CardShowEvent()));
  }
}
