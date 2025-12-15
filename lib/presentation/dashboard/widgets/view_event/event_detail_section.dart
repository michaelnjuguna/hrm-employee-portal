import 'package:flutter/material.dart';

class SheetSection extends StatelessWidget {
  const SheetSection({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
      margin: const EdgeInsets.only(bottom: 8),
      child: child,
    );
  }
}
