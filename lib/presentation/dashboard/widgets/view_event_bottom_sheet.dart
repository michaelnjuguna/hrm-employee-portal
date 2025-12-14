import 'package:flutter/material.dart';

class ViewEventBottomSheet extends StatefulWidget {
  const ViewEventBottomSheet({super.key});
  @override
  State<ViewEventBottomSheet> createState() => _ViewEventBottomSheet();
}

class _ViewEventBottomSheet extends State<ViewEventBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return BottomSheet(
      onClosing: () {},
      builder: (context) {
        return Container();
      },
    );
  }
}
