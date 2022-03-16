import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import './app_menu.dart';
import './split_view.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
}

// 1. extend from ConsumerWidget
class MyApp extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 3. watch selectedPageBuilderProvider
    final selectedPageBuilder = ref.watch(selectedPageBuilderProvider);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      // just return `FirstPage` for now. We'll change this later
      home: SplitView(
        menu: AppMenu(),
        content: selectedPageBuilder(context),
      ),
    );
  }
}
