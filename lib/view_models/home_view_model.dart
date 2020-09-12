import 'package:flutter/material.dart';

enum HomeState { Loading, Error, Loaded }

class HomeViewModel extends ChangeNotifier {
  HomeState _homeState = HomeState.Loading;
  HomeState get homeState => _homeState;

  set setState(HomeState state) {
    _homeState = state;
    notifyListeners();
  }
}
