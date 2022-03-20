import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../screens/about.dart';
import '../constants/menu_pages.dart';
import '../services/app_router.dart';

final appRouterProvider = Provider<AppRouter>((_) => AppRouter(
    headerPage: const About(), headerUrl: 'about-page', menuPages: menuPages));
