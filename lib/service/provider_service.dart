import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../pages/content_home_screen/menu/menu_controller.dart';
import 'theme_manager.dart';

class IProviderService {
  void init() {}
}

class ProviderService {
  init(BuildContext context) {
    return [
      ChangeNotifierProvider(create: (context) => ThemeManager(), lazy: true),

      // Remove toolbar dashboard + add Menu Btn
      ChangeNotifierProvider(create: (context) => MenuController(), lazy: true),
    ];
  }
}