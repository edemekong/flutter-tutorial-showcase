import 'package:get_it/get_it.dart';

import 'package:flutter_tutorials/services/dynamic_link_api.dart';

void setUpGetIt() {
  GetIt.I.registerSingleton<DynamicLinksApi>(DynamicLinksApi());
}
