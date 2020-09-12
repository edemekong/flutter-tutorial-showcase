import 'package:flutter/material.dart';
import 'package:flutter_tutorials/view_models/home_view_model.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(HomeState.Loaded),
    );
  }

  _buildBody(HomeState state) {
    switch (state) {
      case HomeState.Loading:
        return Center(child: CircularProgressIndicator());
      case HomeState.Loaded:
        return Center(child: CircularProgressIndicator());
      default:
        return HomeState.Error;
    }
  }
}
