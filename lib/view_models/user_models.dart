import 'package:flutter/widgets.dart';
import 'package:flutter_tutorials/models/user.dart';
import 'package:flutter_tutorials/services/user_api.dart';
import '../main.dart';

enum HomeState { Initial, Loading, Loaded, Error }

class UserModel extends ChangeNotifier {
  var _homeState = HomeState.Initial;

  UserApi userApi = locator.get<UserApi>();
  List<User> users = [];

  UserModel() {
    _fatchUsers();
  }

  HomeState get homeState => _homeState;

  set changeHomeState(HomeState state) {
    _homeState = state;
    notifyListeners();
  }

  Future<void> _fatchUsers() async {
    _homeState = HomeState.Loading;
    try {
      //Fatch users
      final allUser = await userApi.getAllUser();
      users = allUser;
      _homeState = HomeState.Loaded;
    } catch (e) {
      //Error user
      _homeState = HomeState.Error;
    }
    notifyListeners();
  }
}
