import 'package:flutter/material.dart';

class MyCard extends StatelessWidget {
  final Widget child;
  final BorderSide? borderSide;
  const MyCard({Key? key, required this.child, this.borderSide})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shadowColor: const Color(0xFFDADADA).withOpacity(0.6),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14),
          side: borderSide ?? BorderSide.none),
      child: child,
    );
  }
}
