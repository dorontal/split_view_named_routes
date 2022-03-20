import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/signed_in.dart';
import '../widgets/ok_alert.dart';

Widget buildAuthMenuItem(BuildContext context, WidgetRef ref) {
  final signedInProvider = ref.watch(signedInStateProvider.state);
  final signedIn = signedInProvider.state == true;

  return Material(
      color: Colors.transparent,
      child: ListTile(
          leading: Icon(signedIn ? Icons.logout : Icons.login),
          title: Text(signedIn ? 'Log Out' : 'Log In (or Sign Up)'),
          onTap: () async {
            final newState = !signedIn;
            signedInProvider.state = newState;
            final inOrOut = newState ? 'in' : 'out';
            await showOKAlert(context, message: 'You are now logged $inOrOut!');
          }));
}
