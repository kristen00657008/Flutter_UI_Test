import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'ui/home_page/resource/page parameters.dart';

abstract class ViewChangeEvent {}

class CardShowAnimEvent extends ViewChangeEvent {}

class CardShowEvent extends ViewChangeEvent {}

class CardHideEvent extends ViewChangeEvent {}

class CardHideAnimEvent extends ViewChangeEvent {}

class PageViewExpandingEvent extends ViewChangeEvent {}

class PageViewCompleteExpandEvent extends ViewChangeEvent {}

class PageViewClosingEvent extends ViewChangeEvent {}

class PageViewCompleteCloseEvent extends ViewChangeEvent {}

class RefreshDataEvent extends ViewChangeEvent {}

class RefreshDataFinishEvent extends ViewChangeEvent {}

abstract class ViewState {}

class CardViewState extends ViewState {}

class CardShowState extends CardViewState {}

class CardAnimatingState extends CardViewState {}

class PageViewState extends ViewState {}

class PageViewShowState extends PageViewState {}

class PageViewAnimatingState extends PageViewState {}

class OriginState extends ViewState {}

class RefreshDataState extends OriginState {}

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
    on<RefreshDataEvent>(mapEventToState);
    on<RefreshDataFinishEvent>(mapEventToState);
  }

  late ScrollController listViewScrollController;

  /// Page View 相關
  late PageController pageController;
  late AnimationController pageViewAnimController;
  late Animation<double> pageViewWidthAnim;
  late Animation<double> pageViewHeightAnim;
  late Animation<double> curtainHeightAnim;
  late Animation<double> pageViewRadiusAnim;
  late Animation<double> listViewTopBarHeightAnim;
  late Animation<double> listViewTopBarMarginAnim;

  /// Card View 相關
  late AnimationController cardAnimController;
  late Animation<double> cardRotationAnim;
  late Animation<double> cardScaleAnim;
  late Animation<Offset> cardPositionAnim;
  late Animation<Offset> pageViewPositionAnim;

  final ValueNotifier<double> cardOffset = ValueNotifier<double>(0);

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
    } else if (event is RefreshDataEvent) {
      emit(RefreshDataState());
    } else if (event is RefreshDataFinishEvent) {
      emit(OriginState());
    } else {
      emit(OriginState());
    }
  }

  void openPageViewAnim() {
    pageViewWidthAnim = Tween<double>(begin: pageViewInitWidth, end: pageViewEndWidth).animate(
      CurvedAnimation(
        parent: pageViewAnimController,
        curve: Curves.easeInOut,
      ),
    );

    pageViewHeightAnim = Tween<double>(begin: pageViewInitHeight, end: pageViewEndHeight).animate(
      CurvedAnimation(
        parent: pageViewAnimController,
        curve: Curves.easeInOut,
      ),
    );

    curtainHeightAnim = Tween<double>(begin: curtainInitHeight, end: curtainEndHeight).animate(
      CurvedAnimation(
        parent: pageViewAnimController,
        curve: Curves.easeInOut,
      ),
    );

    pageViewRadiusAnim = Tween<double>(begin: pageViewInitRadius, end:  pageViewEndRadius).animate(
      CurvedAnimation(
        parent: pageViewAnimController,
        curve: Curves.easeInOut,
      ),
    );

    listViewTopBarHeightAnim = Tween<double>(begin: listViewTopBarInitHeight, end:  listViewTopBarEndHeight).animate(
      CurvedAnimation(
        parent: pageViewAnimController,
        curve: Curves.easeInOut,
      ),
    );

    listViewTopBarMarginAnim = Tween<double>(begin: listViewTopBarInitMargin, end:  listViewTopBarEndMargin).animate(
      CurvedAnimation(
        parent: pageViewAnimController,
        curve: Curves.easeInOut,
      ),
    );

    pageViewAnimController.forward().whenComplete(() => add(PageViewCompleteExpandEvent()));
  }

  void closePageViewAnim() {
    if(state is PageViewShowState) {
      listViewScrollController.jumpTo(0);
      add(PageViewClosingEvent());
      pageViewAnimController.reverse().whenComplete(() => add(PageViewCompleteCloseEvent()));
    }
  }

  void openCardAnim() {
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
      end: 2,
    ).animate(
      CurvedAnimation(
        parent: cardAnimController,
        curve: Curves.easeInOut,
      ),
    );

    // 設置位置動畫
    cardPositionAnim = Tween<Offset>(
      begin: Offset(0, 0),
      end: Offset(-1.05, 1),
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

  void closeCardAnim() {
    if(state is CardShowState) {
      add(CardHideAnimEvent());
      cardAnimController.reverse().whenComplete(() => add(CardHideEvent()));
    }
  }

  void refreshData() {
    add(RefreshDataEvent());
    Future.delayed(Duration(seconds: 3), () {
      add(RefreshDataFinishEvent());
    });
  }
}
