import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:split_view_named_routes/providers/app_router.dart';
import 'package:split_view_named_routes/services/app_router.dart';
import '../screens/about.dart';
import './tracktunes_logo.dart';

class AppMenuHeader extends ConsumerWidget {
  const AppMenuHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appRouter = ref.watch(appRouterProvider);
    appRouter.addRoute(MenuPage(page: const About(), url: 'about'));
    return DrawerHeader(
        child: InkWell(
      onTap: () {
        Navigator.of(context).pop();
        Navigator.pushNamed(context, 'header');
      },
      child: const TracktunesLogo(),
    ));
  }
}
