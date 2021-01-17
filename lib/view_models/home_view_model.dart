import 'package:flutter/cupertino.dart';
import 'package:flutter_tutorials/services/dynamic_link_api.dart';
import 'package:get_it/get_it.dart';

class HomeViewModel extends ChangeNotifier {
  final deeplinkApi = GetIt.I.get<DynamicLinksApi>();

  HomeViewModel() {
    deeplinkApi.handleDynamicLink();
  }
}
