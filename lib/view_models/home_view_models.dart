import 'package:flutter/material.dart';

enum HomeState{
  LoadedState,
  LoadingState,
  ErrorState
}

class HomeViewModel extends ChangeNotifier{
  HomeState _homeState = HomeState.LoadingState;


  HomeState get homeState => _homeState;
  void changeState(HomeState state){
    _homeState = state;
    notifyListeners();
  }

}