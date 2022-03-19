import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../constants/menu_pages.dart';
import '../services/app_router.dart';

final appRouterProvider =
    Provider<AppRouter>((_) => AppRouter(menuPages: menuPages));
