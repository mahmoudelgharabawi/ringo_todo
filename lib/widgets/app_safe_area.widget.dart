import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AppSafeArea extends StatelessWidget {
  final Widget body;
  const AppSafeArea({required this.body, super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.fromLTRB(24, 16, 14.7, 52),
        child: body,
      ),
    );
  }
}
