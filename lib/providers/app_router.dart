import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../constants/header_url.dart';
import '../constants/menu_pages.dart';
import '../functions/build_auth_menu_item.dart';
import '../screens/about.dart';
import '../services/app_router.dart';

final appRouterProvider = Provider<AppRouter>((_) => AppRouter(
      headerPage: const About(),
      headerUrl: headerUrl,
      menuPages: menuPages,
      lowerMenuBuilders: [buildAuthMenuItem],
    ));
