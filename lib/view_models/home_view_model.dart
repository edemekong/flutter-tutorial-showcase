import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:showcasing_flutter/services/dynamic_link_api.dart';

class HomeViewModel extends ChangeNotifier {
  final deeplinkApi = GetIt.I.get<DynamicLinksApi>();

  HomeViewModel() {
    deeplinkApi.handleDynamicLink();
  }
}
