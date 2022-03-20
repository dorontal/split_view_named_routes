import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:split_view_named_routes/constants/header_url.dart';
import '../screens/about.dart';
import '../constants/menu_pages.dart';
import '../services/app_router.dart';

final appRouterProvider = Provider<AppRouter>((_) => AppRouter(
      headerPage: const About(),
      headerUrl: headerUrl,
      menuPages: menuPages,
      menuPages2: menuPages2,
    ));
