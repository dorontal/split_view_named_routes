import 'package:flutter/material.dart';

const double defaultWidth = 280;
const double defaultHeight = 440;

class OKAlert extends StatelessWidget {
  final String message;
  final String? title;
  final double width;
  final double height;

  const OKAlert({
    Key? key,
    required this.message,
    this.title,
    this.width = defaultWidth,
    this.height = defaultHeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final containerWidth = size.width;
    final containerHeight = size.height;
    final horizontalPadding =
        containerWidth > width ? 0.5 * (containerWidth - width) : 0.0;
    final verticalPadding =
        containerHeight > height ? 0.5 * (containerHeight - height) : 0.0;
    return AlertDialog(
      insetPadding: EdgeInsets.symmetric(
          horizontal: horizontalPadding, vertical: verticalPadding),
      title: title == null ? null : Text(title as String),
      content: Text(message),
      actions: <Widget>[
        TextButton(
          child: const Text('OK'),
          onPressed: () => {Navigator.of(context).pop()},
        )
      ],
    );
  }
}

Future<OKAlert?> showOKAlert(BuildContext context,
    {required String message,
    String? title,
    double width = defaultWidth,
    double height = defaultHeight}) {
  return showDialog<OKAlert>(
      context: context,
      barrierDismissible: false,
      builder: (_) => OKAlert(
          message: message, title: title, width: width, height: height));
}
